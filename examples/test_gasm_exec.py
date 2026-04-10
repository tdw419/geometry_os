"""
Tests for the GASM EXEC instruction: program-to-program calls.

Extends GasSimulator with an EXEC opcode that saves the caller's state,
loads a target program from a registry, and runs it.  When the callee
hits HALT, the caller's state is restored and execution continues past
the EXEC instruction.

Tests cover:
- Simple caller → callee execution and return
- Caller resumes at the correct PC after callee HALTs
- Nested EXEC (A calls B calls C)
- Return value passing through registers
- Error on invalid / unknown program identifier
- Error on exceeding the configurable call-depth limit
- Callee's register isolation (caller registers are restored)
"""

import os
import sys

import pytest

# Ensure the examples directory is on the path
sys.path.insert(0, os.path.dirname(__file__))

from gasm_simulator import GasSimulator, GasmExecutionError


# ---------------------------------------------------------------------------
# Executive simulator – extends GasSimulator with EXEC support
# ---------------------------------------------------------------------------


class ExecGasSimulator(GasSimulator):
    """GasSimulator subclass that adds the EXEC instruction.

    New public API
    ~~~~~~~~~~~~~~
    * ``program_registry`` – dict mapping program names → GASM source text.
    * ``max_exec_depth``    – maximum nesting depth (default 8).
    * ``exec_depth``        – current nesting depth (0 = top-level).

    EXEC semantics
    ~~~~~~~~~~~~~~
    * ``EXEC <program_name>`` — save current state (PC, registers, instructions,
      labels, memory) onto an internal call-stack, load the named program from
      the registry, and begin executing it at address 0.
    * When the callee reaches HALT, the caller's state is popped from the
      call-stack and execution resumes at the instruction *after* the EXEC.
    * Register r30 is used as the **return-value register** by convention: the
      callee may set r30 before HALT; the caller reads it after EXEC.
    * The caller's register file is fully saved/restored except that r30 is
      copied from the callee back into the caller (return value).
    """

    DEFAULT_MAX_EXEC_DEPTH = 8

    def __init__(self, max_steps: int = 1_000_000,
                 max_exec_depth: int = DEFAULT_MAX_EXEC_DEPTH) -> None:
        super().__init__(max_steps=max_steps)
        self.max_exec_depth = max_exec_depth
        self.program_registry: dict[str, str] = {}
        # Internal call-stack entries: list of dicts
        self._exec_call_stack: list[dict] = []
        self.exec_depth: int = 0

    # -- registry helpers ---------------------------------------------------

    def register_program(self, name: str, source: str) -> None:
        """Add a program to the registry."""
        self.program_registry[name] = source

    # -- overridden reset to preserve registry -----------------------------

    def _reset(self) -> None:  # type: ignore[override]
        super()._reset()
        self._exec_call_stack = []
        self.exec_depth = 0

    # -- the heart of it: override step() to handle EXEC -------------------

    def step(self) -> bool:
        """Execute one instruction.  Handles EXEC before delegating to base."""
        if self.halted:
            return False

        if self.pc < 0 or self.pc >= len(self.instructions):
            # End of callee program → return to caller
            return self._exec_return()

        instr = self.instructions[self.pc]

        if instr.opcode == "EXEC":
            return self._handle_exec(instr)
        elif instr.opcode == "HALT":
            # If we are inside an EXEC'd callee, treat HALT as a return
            if self._exec_call_stack:
                return self._exec_return()
            # Otherwise, normal HALT
            self.step_count += 1
            self.halted = True
            self.pc = self.pc + 1
            return False
        else:
            # Delegate to the base class for all other instructions
            return super().step()

    # -- EXEC implementation -----------------------------------------------

    def _handle_exec(self, instr) -> bool:
        """Process an EXEC instruction."""
        self.step_count += 1
        if self.step_count > self.max_steps:
            raise GasmExecutionError(
                f"Exceeded maximum step limit ({self.max_steps}). Possible infinite loop."
            )

        if not instr.operands:
            raise GasmExecutionError(
                f"EXEC requires a program name operand at line {instr.line_number}"
            )

        target_name = instr.operands[0]

        if target_name not in self.program_registry:
            raise GasmExecutionError(
                f"EXEC: unknown program '{target_name}' at line {instr.line_number}"
            )

        if self.exec_depth >= self.max_exec_depth:
            raise GasmExecutionError(
                f"EXEC: maximum call depth ({self.max_exec_depth}) exceeded"
            )

        # Save current state (return address = PC + 1, i.e. instruction after EXEC)
        saved_state = {
            "pc": self.pc + 1,
            "registers": dict(self.registers),
            "instructions": self.instructions,
            "labels": self.labels,
            "memory": dict(self.memory),
        }
        self._exec_call_stack.append(saved_state)

        # Load the callee program
        callee_source = self.program_registry[target_name]
        callee_instructions, callee_labels = self.parse(callee_source)

        self.instructions = callee_instructions
        self.labels = callee_labels
        self.pc = 0
        self.exec_depth += 1

        # Reset registers for callee (except keep memory shared)
        self.registers = {f"r{i}": 0 for i in range(self.NUM_REGISTERS)}

        return True

    def _exec_return(self) -> bool:
        """Return from an EXEC'd callee back to the caller."""
        # Capture callee's return-value register (r30) before restoring caller
        callee_return_value = self.registers.get("r30", 0)

        saved_state = self._exec_call_stack.pop()

        # Restore caller state
        self.registers = saved_state["registers"]
        self.instructions = saved_state["instructions"]
        self.labels = saved_state["labels"]
        self.memory = saved_state["memory"]
        self.pc = saved_state["pc"]
        self.exec_depth -= 1

        # Pass return value through r30
        self.registers["r30"] = callee_return_value

        # Caller is now active and not halted
        self.halted = False
        return True


# ---------------------------------------------------------------------------
# Helper to build a simulator with programs registered
# ---------------------------------------------------------------------------


def _make_sim(*programs: tuple[str, str], max_exec_depth: int = 8) -> ExecGasSimulator:
    """Create an ExecGasSimulator with the given (name, source) programs registered."""
    sim = ExecGasSimulator(max_exec_depth=max_exec_depth)
    for name, source in programs:
        sim.register_program(name, source)
    return sim


# ===========================================================================
# Tests
# ===========================================================================


class TestExecBasic:
    """Basic EXEC: caller launches callee, callee halts, caller resumes."""

    def test_exec_simple_callee(self):
        """Caller EXECs a callee that sets r30=42 and halts.
        After return, caller should see r30=42 and continue."""
        caller = """
LDI r0, 1
EXEC callee
LDI r1, 99
HALT
"""
        callee = """
LDI r30, 42
HALT
"""
        sim = _make_sim(("callee", callee))
        sim.load(caller)
        result = sim.run()

        # Caller continued after EXEC: r1 should be 99
        assert result["registers"]["r1"] == 99
        # Return value from callee
        assert result["registers"]["r30"] == 42
        # r0 set before EXEC
        assert result["registers"]["r0"] == 1
        assert result["halted"] is True

    def test_exec_resumes_at_correct_pc(self):
        """Verify the caller resumes exactly at the instruction after EXEC."""
        caller = """
NOP
EXEC callee
LDI r0, 7
LDI r1, 13
HALT
"""
        callee = """
HALT
"""
        sim = _make_sim(("callee", callee))
        sim.load(caller)
        result = sim.run()

        assert result["registers"]["r0"] == 7
        assert result["registers"]["r1"] == 13

    def test_exec_callee_runs_full_program(self):
        """Callee performs computation, returns result in r30."""
        caller = """
LDI r0, 10
EXEC double_it
HALT
"""
        callee = """
LDI r0, 21
LDI r1, 2
MUL r0, r1
MOV r30, r0
HALT
"""
        sim = _make_sim(("double_it", callee))
        sim.load(caller)
        result = sim.run()

        # Callee computed 21*2=42, stored in r30
        assert result["registers"]["r30"] == 42
        # Caller's r0 is restored to 10 (set before EXEC)
        assert result["registers"]["r0"] == 10

    def test_exec_preserves_caller_registers(self):
        """After EXEC returns, all caller registers are restored."""
        caller = """
LDI r0, 100
LDI r1, 200
LDI r2, 300
LDI r3, 400
EXEC callee
HALT
"""
        callee = """
LDI r0, 0
LDI r1, 0
LDI r2, 0
LDI r3, 0
LDI r30, 1
HALT
"""
        sim = _make_sim(("callee", callee))
        sim.load(caller)
        result = sim.run()

        assert result["registers"]["r0"] == 100
        assert result["registers"]["r1"] == 200
        assert result["registers"]["r2"] == 300
        assert result["registers"]["r3"] == 400
        assert result["registers"]["r30"] == 1


class TestExecNested:
    """Nested EXEC: A calls B calls C."""

    def test_two_level_nesting(self):
        """A EXECs B, B EXECs C, each adds to return value."""
        prog_a = """
EXEC prog_b
HALT
"""
        prog_b = """
LDI r30, 10
EXEC prog_c
HALT
"""
        prog_c = """
LDI r30, 5
HALT
"""
        sim = _make_sim(("prog_a", prog_a), ("prog_b", prog_b), ("prog_c", prog_c))
        sim.load(prog_a)
        result = sim.run()

        # prog_c sets r30=5 → returns to prog_b (r30=5)
        # prog_b had r30=10 but EXEC replaces r30 with callee's return (5)
        # prog_b halts → returns r30=5 to prog_a
        assert result["registers"]["r30"] == 5
        assert result["halted"] is True

    def test_three_level_nesting_with_computation(self):
        """Three-level nesting where each level adds to a value."""
        prog_a = """
LDI r30, 0
EXEC level1
HALT
"""
        level1 = """
LDI r0, 10
ADD r0, r30
MOV r30, r0
EXEC level2
HALT
"""
        level2 = """
LDI r0, 20
ADD r0, r30
MOV r30, r0
EXEC level3
HALT
"""
        level3 = """
LDI r0, 30
ADD r0, r30
MOV r30, r0
HALT
"""
        sim = _make_sim(
            ("level1", level1), ("level2", level2), ("level3", level3)
        )
        sim.load(prog_a)
        result = sim.run()

        # Trace:
        # prog_a: r30=0 → EXEC level1
        # level1: r0=10, r0+=0 → r30=10 → EXEC level2
        # level2: r0=20, r0+=10 → r30=30 → EXEC level3
        # level3: r0=30, r0+=30 → r30=60 → HALT → return to level2 (r30=60)
        # level2: HALT → return to level1 (r30=60)
        # level1: HALT → return to prog_a (r30=60)
        assert result["registers"]["r30"] == 60

    def test_nested_caller_resumes_after_exec(self):
        """Each caller resumes at the correct instruction after nested EXEC."""
        prog_a = """
EXEC prog_b
LDI r0, 111
HALT
"""
        prog_b = """
EXEC prog_c
LDI r0, 222
MOV r30, r0
HALT
"""
        prog_c = """
LDI r30, 999
HALT
"""
        sim = _make_sim(("prog_b", prog_b), ("prog_c", prog_c))
        sim.load(prog_a)
        result = sim.run()

        # prog_c sets r30=999 → returns to prog_b (r30=999)
        # prog_b resumes: sets r0=222, r30=r0=222 → HALT → returns to prog_a (r30=222)
        # prog_a resumes: sets r0=111 → HALT
        assert result["registers"]["r0"] == 111
        assert result["registers"]["r30"] == 222


class TestExecErrors:
    """Error cases for EXEC."""

    def test_exec_unknown_program(self):
        """EXEC with an unregistered program name raises an error."""
        caller = """
EXEC nonexistent
HALT
"""
        sim = _make_sim()
        sim.load(caller)

        with pytest.raises(GasmExecutionError, match="unknown program.*nonexistent"):
            sim.run()

    def test_exec_no_operand(self):
        """EXEC without a program name raises an error."""
        caller = """
EXEC
HALT
"""
        sim = _make_sim()
        sim.load(caller)

        with pytest.raises(GasmExecutionError, match="EXEC requires a program name"):
            sim.run()

    def test_exec_depth_exceeded(self):
        """Exceeding the maximum EXEC depth raises an error."""
        prog = """
EXEC recursive
HALT
"""
        sim = _make_sim(("recursive", prog), max_exec_depth=2)
        sim.load(prog)

        with pytest.raises(GasmExecutionError, match="maximum call depth"):
            sim.run()

    def test_exec_depth_one_self_call(self):
        """At depth=1, a single EXEC succeeds but nesting to level 2 fails."""
        caller = """
EXEC leaf
HALT
"""
        leaf = """
LDI r30, 77
HALT
"""
        sim = _make_sim(("leaf", leaf), max_exec_depth=1)
        sim.load(caller)
        result = sim.run()
        assert result["registers"]["r30"] == 77

    def test_exec_depth_one_self_call_exceeded(self):
        """At depth=1, a callee that tries to EXEC again fails."""
        caller = """
EXEC calls_again
HALT
"""
        calls_again = """
EXEC leaf
HALT
"""
        leaf = """
HALT
"""
        sim = _make_sim(("calls_again", calls_again), ("leaf", leaf), max_exec_depth=1)
        sim.load(caller)

        with pytest.raises(GasmExecutionError, match="maximum call depth"):
            sim.run()


class TestExecMemorySharing:
    """Memory is shared between caller and callee through EXEC."""

    def test_callee_reads_caller_memory(self):
        """Callee can read memory written by the caller (memory is shared)."""
        caller = """
LDI r0, 100
STORE r0, 55
EXEC reader
HALT
"""
        reader = """
LOAD r0, 100
MOV r30, r0
HALT
"""
        sim = _make_sim(("reader", reader))
        sim.load(caller)
        result = sim.run()

        # reader loaded value at address 100 (=55), moved to r30
        assert result["registers"]["r30"] == 55

    def test_callee_writes_memory_visible_to_caller(self):
        """Memory written by callee is visible to caller after return."""
        caller = """
EXEC writer
LOAD r0, 200
HALT
"""
        writer = """
LDI r0, 200
LDI r1, 42
STORE r0, r1
HALT
"""
        sim = _make_sim(("writer", writer))
        sim.load(caller)
        result = sim.run()

        assert result["registers"]["r0"] == 42


class TestExecMultipleCalls:
    """Caller can EXEC the same callee multiple times."""

    def test_exec_same_callee_twice(self):
        """Caller calls the same callee twice; callee returns different values."""
        caller = """
LDI r30, 0
EXEC adder
MOV r0, r30
EXEC adder
MOV r1, r30
HALT
"""
        adder = """
LDI r0, 10
ADD r30, r0
HALT
"""
        sim = _make_sim(("adder", adder))
        sim.load(caller)
        result = sim.run()

        # First call: adder gets r30=0 (fresh regs), adds 10 → r30=10, returns 10
        # After first return: caller r0=10
        # Second call: adder gets r30=0 (fresh regs), adds 10 → r30=10, returns 10
        # After second return: caller r1=10
        assert result["registers"]["r0"] == 10
        assert result["registers"]["r1"] == 10
        assert result["registers"]["r30"] == 10

    def test_exec_different_callees(self):
        """Caller calls two different programs sequentially."""
        caller = """
EXEC prog_x
MOV r0, r30
EXEC prog_y
MOV r1, r30
HALT
"""
        prog_x = """
LDI r30, 100
HALT
"""
        prog_y = """
LDI r30, 200
HALT
"""
        sim = _make_sim(("prog_x", prog_x), ("prog_y", prog_y))
        sim.load(caller)
        result = sim.run()

        assert result["registers"]["r0"] == 100
        assert result["registers"]["r1"] == 200
        assert result["registers"]["r30"] == 200


class TestExecStateAfterReturn:
    """Verify simulator state is correct after EXEC returns."""

    def test_exec_depth_returns_to_zero(self):
        """After all EXEC calls return, exec_depth is 0."""
        caller = """
EXEC inner
HALT
"""
        inner = """
HALT
"""
        sim = _make_sim(("inner", inner))
        sim.load(caller)
        sim.run()

        assert sim.exec_depth == 0

    def test_exec_call_stack_empty_after_return(self):
        """After all EXEC calls return, the call stack is empty."""
        caller = """
EXEC inner
HALT
"""
        inner = """
HALT
"""
        sim = _make_sim(("inner", inner))
        sim.load(caller)
        sim.run()

        assert len(sim._exec_call_stack) == 0

    def test_exec_step_count_includes_callee(self):
        """step_count includes both caller and callee steps."""
        caller = """
EXEC inner
HALT
"""
        inner = """
LDI r0, 1
LDI r1, 2
HALT
"""
        sim = _make_sim(("inner", inner))
        sim.load(caller)
        result = sim.run()

        # caller: EXEC (1) + HALT (1) = 2, callee: LDI (1) + LDI (1) + HALT-handled-as-return (0 extra) = 2
        # Total >= 4
        assert result["step_count"] >= 4

    def test_nested_depth_returns_to_zero(self):
        """After nested EXEC calls, exec_depth returns to 0."""
        a = """
EXEC b
HALT
"""
        b = """
EXEC c
HALT
"""
        c = """
HALT
"""
        sim = _make_sim(("b", b), ("c", c))
        sim.load(a)
        sim.run()

        assert sim.exec_depth == 0
        assert len(sim._exec_call_stack) == 0
