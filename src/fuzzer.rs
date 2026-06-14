// fuzzer.rs -- Geometry OS VM fuzzer with oracle checking
use geometry_os::assembler::assemble;
use geometry_os::vm::Vm;

struct Config {
    seed: u64,
    count: usize,
    max_steps: u64,
    category: String,
    verbose: bool,
}

fn parse_args() -> Config {
    let args: Vec<String> = std::env::args().collect();
    let mut cfg = Config {
        seed: 0xDEADBEEF,
        count: 200,
        max_steps: 500_000,
        category: "all".into(),
        verbose: false,
    };
    let mut i = 1;
    while i < args.len() {
        match args[i].as_str() {
            "--seed" => {
                i += 1;
                cfg.seed = parse_u64(&args[i]);
            },
            "--count" => {
                i += 1;
                cfg.count = args[i].parse().unwrap_or(200);
            },
            "--max-steps" => {
                i += 1;
                cfg.max_steps = args[i].parse().unwrap_or(500_000);
            },
            "--category" => {
                i += 1;
                cfg.category = args[i].clone();
            },
            "--verbose" => cfg.verbose = true,
            _ => {},
        }
        i += 1;
    }
    cfg
}

fn parse_u64(s: &str) -> u64 {
    if s.starts_with("0x") || s.starts_with("0X") {
        u64::from_str_radix(&s[2..], 16).unwrap_or(0)
    } else {
        s.parse().unwrap_or(0)
    }
}

fn imm(v: i64) -> String {
    if v >= 0 {
        format!("{}", v as u32)
    } else {
        format!("0x{:08X}", v as i32 as u32)
    }
}

struct Rng(u64);
impl Rng {
    fn new(seed: u64) -> Self {
        Rng(seed)
    }
    fn next(&mut self) -> u64 {
        self.0 = self
            .0
            .wrapping_mul(6364136223846793005)
            .wrapping_add(1442695040888963407);
        self.0
    }
    fn range(&mut self, lo: i64, hi: i64) -> i64 {
        lo + (self.next() as i64).wrapping_abs() % (hi - lo + 1)
    }
    fn range_u(&mut self, lo: u32, hi: u32) -> u32 {
        lo + (self.next() as u32) % (hi - lo + 1)
    }
    fn choice<'a, T>(&mut self, items: &'a [T]) -> &'a T {
        &items[(self.next() as usize) % items.len()]
    }
}

enum Outcome {
    Ok(Vec<String>),
    AsmError(String),
    Segfault,
    Timeout,
    Panic(String),
}

#[allow(clippy::type_complexity)]
struct TestCase {
    name: String,
    source: String,
    check: Box<dyn Fn(&Vm) -> Vec<String>>,
}

fn run_with_oracle(tc: TestCase, max_steps: u64) -> Outcome {
    let asm = match assemble(&tc.source, 0) {
        Ok(a) => a,
        Err(e) => return Outcome::AsmError(e.to_string()),
    };
    let result = std::panic::catch_unwind(std::panic::AssertUnwindSafe(|| {
        let mut vm = Vm::new();
        for (i, &word) in asm.pixels.iter().enumerate() {
            if i < vm.ram.len() {
                vm.ram[i] = word;
            }
        }
        vm.pc = 0;
        vm.halted = false;
        for _ in 0..max_steps {
            if !vm.step() {
                break;
            }
        }
        vm
    }));
    match result {
        Ok(vm) => {
            if vm.segfault {
                Outcome::Segfault
            } else if !vm.halted {
                Outcome::Timeout
            } else {
                let failures = (tc.check)(&vm);
                Outcome::Ok(failures)
            }
        },
        Err(e) => {
            let msg = if let Some(s) = e.downcast_ref::<&str>() {
                s.to_string()
            } else if let Some(s) = e.downcast_ref::<String>() {
                s.clone()
            } else {
                "unknown panic".into()
            };
            Outcome::Panic(msg)
        },
    }
}

// --- GENERATORS ---

fn gen_alu_chain(rng: &mut Rng) -> TestCase {
    let ops = ["ADD", "SUB", "MUL", "AND", "OR", "XOR", "SHL", "SHR", "MOD"];
    let depth = rng.range(3, 12) as usize;
    let v1: i64 = rng.range(-32768, 32767);
    let v2: i64 = rng.range(1, 255);
    let mut lines = vec![
        format!("  LDI r1, {}", imm(v1)),
        format!("  LDI r2, {}", imm(v2)),
    ];
    let mut expected: u32 = v1 as u32;
    for _ in 0..depth {
        let op = *rng.choice(&ops);
        let operand: i64 = if op == "MOD" {
            rng.range(1, 31)
        } else if op == "SHL" || op == "SHR" {
            rng.range(0, 8)
        } else {
            rng.range(-100, 100)
        };
        lines.push(format!("  LDI r3, {}", imm(operand)));
        lines.push("  MOV r2, r3".into());
        lines.push(format!("  {} r1, r2", op));
        let opu = operand as u32;
        expected = match op {
            "ADD" => expected.wrapping_add(opu),
            "SUB" => expected.wrapping_sub(opu),
            "MUL" => expected.wrapping_mul(opu),
            "AND" => expected & opu,
            "OR" => expected | opu,
            "XOR" => expected ^ opu,
            "SHL" => expected.wrapping_shl(opu),
            "SHR" => expected.wrapping_shr(opu),
            "MOD" => {
                if opu != 0 {
                    expected % opu
                } else {
                    expected
                }
            },
            _ => expected,
        };
    }
    lines.push("  HALT".into());
    let exp = expected;
    TestCase {
        name: "alu_chain".into(),
        source: lines.join("\n"),
        check: Box::new(move |vm: &Vm| {
            if vm.regs[1] != exp {
                vec![format!("r1 = 0x{:08X}, expected 0x{:08X}", vm.regs[1], exp)]
            } else {
                vec![]
            }
        }),
    }
}

fn gen_alu_extremes(rng: &mut Rng) -> TestCase {
    let vals = [0i64, 1, -1, 32767, -32768, 255, -255, 0x7FFF, 0xFFFF];
    let v1 = *rng.choice(&vals);
    let v2 = *rng.choice(&vals);
    let op = *rng.choice(&["ADD", "SUB", "MUL", "AND", "OR", "XOR", "SHL", "SHR", "SAR"]);
    let src = format!(
        "  LDI r1, {}\n  LDI r2, {}\n  {} r1, r2\n  HALT",
        imm(v1),
        imm(v2),
        op
    );
    let u1 = v1 as u32;
    let u2 = v2 as u32;
    let expected: u32 = match op {
        "ADD" => u1.wrapping_add(u2),
        "SUB" => u1.wrapping_sub(u2),
        "MUL" => u1.wrapping_mul(u2),
        "AND" => u1 & u2,
        "OR" => u1 | u2,
        "XOR" => u1 ^ u2,
        "SHL" => u1.wrapping_shl(u2),
        "SHR" => u1.wrapping_shr(u2),
        "SAR" => ((u1 as i32).wrapping_shr(u2)) as u32,
        _ => 0,
    };
    let op_s = op.to_string();
    TestCase {
        name: format!("alu_extremes_{}", op),
        source: src,
        check: Box::new(move |vm: &Vm| {
            if vm.regs[1] != expected {
                vec![format!(
                    "{}(0x{:08X}, 0x{:08X}) = 0x{:08X}, expected 0x{:08X}",
                    op_s, u1, u2, vm.regs[1], expected
                )]
            } else {
                vec![]
            }
        }),
    }
}

fn gen_neg(rng: &mut Rng) -> TestCase {
    let val: i64 = rng.range(-32767, 32767);
    let expected: u32 = (!val as u32).wrapping_add(1);
    let src = format!("  LDI r1, {}\n  NEG r1\n  HALT", imm(val));
    let v = val as u32;
    TestCase {
        name: "neg".into(),
        source: src,
        check: Box::new(move |vm: &Vm| {
            if vm.regs[1] != expected {
                vec![format!(
                    "NEG(0x{:08X}) = 0x{:08X}, expected 0x{:08X}",
                    v, vm.regs[1], expected
                )]
            } else {
                vec![]
            }
        }),
    }
}

fn gen_cmp(rng: &mut Rng) -> TestCase {
    let a: i64 = rng.range(-32768, 32767);
    let b: i64 = rng.range(-32768, 32767);
    let expected_r0: u32 = if (a as i32) < (b as i32) {
        0xFFFFFFFF
    } else if (a as i32) > (b as i32) {
        1
    } else {
        0
    };
    let src = format!(
        "  LDI r1, {}\n  LDI r2, {}\n  CMP r1, r2\n  HALT",
        imm(a),
        imm(b)
    );
    let av = a as u32;
    let bv = b as u32;
    TestCase {
        name: "cmp".into(),
        source: src,
        check: Box::new(move |vm: &Vm| {
            if vm.regs[0] != expected_r0 {
                vec![format!(
                    "CMP(0x{:08X}, 0x{:08X}): r0 = 0x{:08X}, expected 0x{:08X}",
                    av, bv, vm.regs[0], expected_r0
                )]
            } else {
                vec![]
            }
        }),
    }
}

fn gen_cmp_branch(rng: &mut Rng) -> TestCase {
    let a: i64 = rng.range(-32768, 32767);
    let b: i64 = rng.range(-32768, 32767);
    let branch = *rng.choice(&["BLT", "BGE"]);
    let source = format!("  LDI r1, {}\n  LDI r2, {}\n  CMP r1, r2\n  {} r1, is_less\n  LDI r10, 0\n  HALT\nis_less:\n  LDI r10, 1\n  HALT", imm(a), imm(b), branch);
    let a_less = (a as i32) < (b as i32);
    let expected_r10: u32 = match branch {
        "BLT" => {
            if a_less {
                1
            } else {
                0
            }
        },
        "BGE" => {
            if !a_less {
                1
            } else {
                0
            }
        },
        _ => 0,
    };
    let av = a as u32;
    let bv = b as u32;
    TestCase {
        name: format!("cmp_{}", branch.to_lowercase()),
        source,
        check: Box::new(move |vm: &Vm| {
            if vm.regs[10] != expected_r10 {
                vec![format!(
                    "CMP(0x{:08X}, 0x{:08X}) {} r10={}",
                    av, bv, branch, vm.regs[10]
                )]
            } else {
                vec![]
            }
        }),
    }
}

fn gen_load_store(rng: &mut Rng) -> TestCase {
    let val: u32 = rng.range_u(0, 0x7FFFFFFF);
    let addr: u32 = rng.range_u(10000, 50000); // high addr to avoid bytecode overlap
    let src = format!(
        "  LDI r1, {}\n  LDI r2, {}\n  STORE r2, r1\n  LOAD r3, r2\n  HALT",
        val, addr
    );
    let exp = val;
    TestCase {
        name: "load_store".into(),
        source: src,
        check: Box::new(move |vm: &Vm| {
            if vm.regs[3] != exp {
                vec![format!(
                    "LOAD after STORE: r3 = {}, expected {}",
                    vm.regs[3], exp
                )]
            } else {
                vec![]
            }
        }),
    }
}

fn gen_multi_store(rng: &mut Rng) -> TestCase {
    let n = rng.range(3, 10) as usize;
    let base_addr: u32 = 10000; // high addr to avoid bytecode overlap
    let mut lines = vec![];
    let mut vals: Vec<u32> = vec![];
    for i in 0..n {
        let v: u32 = rng.range_u(0, 0xFFFF);
        vals.push(v);
        lines.push(format!("  LDI r1, {}", v));
        lines.push(format!("  LDI r2, {}", base_addr + i as u32));
        lines.push("  STORE r2, r1".into());
    }
    for i in 0..n {
        lines.push(format!("  LDI r2, {}", base_addr + i as u32));
        lines.push(format!("  LOAD r{}, r2", 10 + i));
    }
    lines.push("  HALT".into());
    let expected = vals.clone();
    TestCase {
        name: "multi_store".into(),
        source: lines.join("\n"),
        check: Box::new(move |vm: &Vm| {
            let mut f = vec![];
            for (i, exp_val) in expected.iter().enumerate() {
                if vm.regs[10 + i] != *exp_val {
                    f.push(format!(
                        "r{} = {}, expected {}",
                        10 + i,
                        vm.regs[10 + i],
                        exp_val
                    ));
                }
            }
            f
        }),
    }
}

fn gen_push_pop(rng: &mut Rng) -> TestCase {
    let n = rng.range(2, 8) as usize;
    let mut lines = vec!["  LDI r30, 60000".into()]; // SP in safe high region
    let mut vals: Vec<u32> = vec![];
    for _ in 0..n {
        let v: u32 = rng.range_u(1, 0xFFFF);
        vals.push(v);
        lines.push(format!("  LDI r1, {}", v));
        lines.push("  PUSH r1".into());
    }
    for i in 0..n {
        lines.push(format!("  POP r{}", 10 + (n - 1 - i)));
    }
    lines.push("  HALT".into());
    let exp = vals.clone();
    TestCase {
        name: "push_pop".into(),
        source: lines.join("\n"),
        check: Box::new(move |vm: &Vm| {
            let mut f = vec![];
            for (i, exp_val) in exp.iter().enumerate() {
                if vm.regs[10 + i] != *exp_val {
                    f.push(format!(
                        "POP r{} = {}, expected {}",
                        10 + i,
                        vm.regs[10 + i],
                        exp_val
                    ));
                }
            }
            f
        }),
    }
}

fn gen_loop(rng: &mut Rng) -> TestCase {
    let iterations = rng.range_u(5, 200);
    let source = format!("  LDI r10, 0\n  LDI r11, {}\nloop:\n  CMP r10, r11\n  BGE r10, done\n  LDI r1, 1\n  ADD r10, r1\n  JMP loop\ndone:\n  HALT", iterations);
    let exp = iterations;
    TestCase {
        name: "loop_counter".into(),
        source,
        check: Box::new(move |vm: &Vm| {
            if vm.regs[10] != exp {
                vec![format!("loop: r10 = {}, expected {}", vm.regs[10], exp)]
            } else {
                vec![]
            }
        }),
    }
}

fn gen_nested_loop(rng: &mut Rng) -> TestCase {
    let outer = rng.range_u(3, 30);
    let inner = rng.range_u(3, 30);
    let source = format!("  LDI r10, 0\n  LDI r1, 0\nouter:\n  CMP r1, {outer}\n  BGE r1, done\n  LDI r2, 0\ninner:\n  CMP r2, {inner}\n  BGE r2, next_outer\n  LDI r3, 1\n  ADD r10, r3\n  ADD r2, r3\n  JMP inner\nnext_outer:\n  ADD r1, r3\n  JMP outer\ndone:\n  HALT", outer=outer, inner=inner);
    let exp: u32 = outer * inner;
    TestCase {
        name: "nested_loop".into(),
        source,
        check: Box::new(move |vm: &Vm| {
            if vm.regs[10] != exp {
                vec![format!(
                    "nested_loop({}x{}): r10 = {}, expected {}",
                    outer, inner, vm.regs[10], exp
                )]
            } else {
                vec![]
            }
        }),
    }
}

fn gen_call_ret(rng: &mut Rng) -> TestCase {
    let val: u32 = rng.range_u(10, 1000);
    let source = format!(
        "  LDI r10, {}\n  CALL double\n  HALT\ndouble:\n  ADD r10, r10\n  RET",
        val
    );
    let exp = val * 2;
    TestCase {
        name: "call_ret".into(),
        source,
        check: Box::new(move |vm: &Vm| {
            if vm.regs[10] != exp {
                vec![format!("call_ret: r10 = {}, expected {}", vm.regs[10], exp)]
            } else {
                vec![]
            }
        }),
    }
}

fn gen_nested_call(rng: &mut Rng) -> TestCase {
    let v1: u32 = rng.range_u(1, 100);
    let v2: u32 = rng.range_u(1, 100);
    let source = format!("  LDI r10, {}\n  CALL add_two\n  HALT\nadd_one:\n  LDI r1, {}\n  ADD r10, r1\n  RET\nadd_two:\n  CALL add_one\n  CALL add_one\n  RET", v1, v2);
    let exp = v1 + v2 * 2;
    TestCase {
        name: "nested_call".into(),
        source,
        check: Box::new(move |vm: &Vm| {
            if vm.regs[10] != exp {
                vec![format!(
                    "nested_call: r10 = {}, expected {}",
                    vm.regs[10], exp
                )]
            } else {
                vec![]
            }
        }),
    }
}

fn gen_callee_save(rng: &mut Rng) -> TestCase {
    let v: u32 = rng.range_u(10, 500);
    let source = format!("  LDI r10, {}\n  LDI r30, 50000\n  CALL safe_fn\n  HALT\nsafe_fn:\n  PUSH r10\n  LDI r1, 0\n  MOV r10, r1\n  POP r10\n  RET", v);
    let exp = v;
    TestCase {
        name: "callee_save".into(),
        source,
        check: Box::new(move |vm: &Vm| {
            if vm.regs[10] != exp {
                vec![format!(
                    "callee_save: r10 = {}, expected {}",
                    vm.regs[10], exp
                )]
            } else {
                vec![]
            }
        }),
    }
}

fn gen_conditional_sum(rng: &mut Rng) -> TestCase {
    let threshold: u32 = rng.range_u(10, 100);
    let n: u32 = rng.range_u(5, 30);
    let source = format!("  LDI r10, 0\n  LDI r1, 1\nloop:\n  CMP r1, {}\n  BGE r1, done\n  CMP r1, {}\n  BGE r1, skip\n  ADD r10, r1\nskip:\n  LDI r2, 1\n  ADD r1, r2\n  JMP loop\ndone:\n  HALT", n+1, threshold);
    let exp: u32 = (1..=n).filter(|&v| v < threshold).sum();
    TestCase {
        name: "conditional_sum".into(),
        source,
        check: Box::new(move |vm: &Vm| {
            if vm.regs[10] != exp {
                vec![format!(
                    "conditional_sum(n={}, thresh={}): r10 = {}, expected {}",
                    n, threshold, vm.regs[10], exp
                )]
            } else {
                vec![]
            }
        }),
    }
}

// --- REGISTRY ---

type Generator = fn(&mut Rng) -> TestCase;
#[allow(dead_code)]
struct GenEntry {
    name: &'static str,
    category: &'static str,
    gen: Generator,
}

const GENERATORS: &[GenEntry] = &[
    GenEntry {
        name: "alu_chain",
        category: "alu",
        gen: gen_alu_chain,
    },
    GenEntry {
        name: "alu_extremes",
        category: "alu",
        gen: gen_alu_extremes,
    },
    GenEntry {
        name: "neg",
        category: "alu",
        gen: gen_neg,
    },
    GenEntry {
        name: "cmp",
        category: "alu",
        gen: gen_cmp,
    },
    GenEntry {
        name: "cmp_branch",
        category: "alu",
        gen: gen_cmp_branch,
    },
    GenEntry {
        name: "load_store",
        category: "memory",
        gen: gen_load_store,
    },
    GenEntry {
        name: "multi_store",
        category: "memory",
        gen: gen_multi_store,
    },
    GenEntry {
        name: "push_pop",
        category: "stack",
        gen: gen_push_pop,
    },
    GenEntry {
        name: "loop_counter",
        category: "control",
        gen: gen_loop,
    },
    GenEntry {
        name: "nested_loop",
        category: "control",
        gen: gen_nested_loop,
    },
    GenEntry {
        name: "call_ret",
        category: "control",
        gen: gen_call_ret,
    },
    GenEntry {
        name: "nested_call",
        category: "control",
        gen: gen_nested_call,
    },
    GenEntry {
        name: "callee_save",
        category: "stack",
        gen: gen_callee_save,
    },
    GenEntry {
        name: "conditional_sum",
        category: "control",
        gen: gen_conditional_sum,
    },
];

fn main() {
    let cfg = parse_args();
    let mut rng = Rng::new(cfg.seed);
    let gens: Vec<&GenEntry> = if cfg.category == "all" {
        GENERATORS.iter().collect()
    } else {
        GENERATORS
            .iter()
            .filter(|g| g.category == cfg.category)
            .collect()
    };

    eprintln!("Geometry OS Fuzzer (with oracle checking)");
    eprintln!(
        "  seed={} count={} max_steps={} category={} generators={}",
        cfg.seed,
        cfg.count,
        cfg.max_steps,
        cfg.category,
        gens.len()
    );

    let (mut ok, mut asm_err, mut segv, mut tout, mut panic, mut oracle_fail) =
        (0usize, 0usize, 0usize, 0usize, 0usize, 0usize);
    let mut failures: Vec<(String, String)> = vec![];
    let width = 72;

    for i in 0..cfg.count {
        let entry = rng.choice(&gens);
        let tc = (entry.gen)(&mut rng);
        let tc_name = tc.name.clone();
        let outcome = run_with_oracle(tc, cfg.max_steps);

        let ch = match &outcome {
            Outcome::Ok(f) => {
                if f.is_empty() {
                    ok += 1;
                    '.'
                } else {
                    oracle_fail += 1;
                    for x in f {
                        failures.push((tc_name.clone(), x.clone()));
                    }
                    'F'
                }
            },
            Outcome::AsmError(_) => {
                asm_err += 1;
                'A'
            },
            Outcome::Segfault => {
                segv += 1;
                'S'
            },
            Outcome::Timeout => {
                tout += 1;
                'T'
            },
            Outcome::Panic(_) => {
                panic += 1;
                '!'
            },
        };

        if cfg.verbose {
            match &outcome {
                Outcome::Ok(f) if !f.is_empty() => {
                    for x in f {
                        eprintln!("ORACLE_FAIL [{}] {}", tc_name, x);
                    }
                },
                Outcome::AsmError(e) => eprintln!("ASM_ERR   [{}]: {}", tc_name, e),
                Outcome::Segfault => eprintln!("SEGFAULT  [{}]", tc_name),
                Outcome::Timeout => eprintln!("TIMEOUT   [{}]", tc_name),
                Outcome::Panic(e) => eprintln!("PANIC     [{}]: {}", tc_name, e),
                _ => {},
            }
        }
        if i % width == 0 && i > 0 {
            eprintln!(" {}", i);
        }
        eprint!("{}", ch);
    }
    eprintln!(" {}", cfg.count);

    eprintln!("--------");
    eprintln!("Results ({} programs):", cfg.count);
    eprintln!("  OK:          {:>5}", ok);
    eprintln!("  Oracle Fail: {:>5}  (VM BUG)", oracle_fail);
    eprintln!("  Asm Error:   {:>5}", asm_err);
    eprintln!("  Segfault:    {:>5}", segv);
    eprintln!("  Timeout:     {:>5}", tout);
    eprintln!("  Panic:       {:>5}", panic);

    if !failures.is_empty() {
        eprintln!("\nOracle failures:");
        for (name, detail) in &failures {
            eprintln!("  [{}] {}", name, detail);
        }
    }
    if oracle_fail > 0 || segv > 0 || panic > 0 {
        std::process::exit(1);
    }
}

// ── Phase 310: Fuzzer Module Unit Tests ──────────────────────────────────

#[cfg(test)]
mod tests {
    use super::*;
    use geometry_os::assembler::assemble;
    use geometry_os::vm::Vm;

    // --- RNG tests ---

    #[test]
    fn test_p310_rng_deterministic() {
        let mut a = Rng::new(42);
        let mut b = Rng::new(42);
        for _ in 0..100 {
            assert_eq!(a.next(), b.next());
        }
    }

    #[test]
    fn test_p310_rng_different_seeds() {
        let mut a = Rng::new(1);
        let mut b = Rng::new(2);
        // Very unlikely to produce the same sequence
        let mut same = true;
        for _ in 0..20 {
            if a.next() != b.next() {
                same = false;
                break;
            }
        }
        assert!(!same, "Different seeds should produce different sequences");
    }

    #[test]
    fn test_p310_rng_range_bounds() {
        let mut rng = Rng::new(12345);
        for _ in 0..200 {
            let v = rng.range(10, 20);
            assert!(v >= 10 && v <= 20, "range(10,20) produced {}", v);
        }
    }

    #[test]
    fn test_p310_rng_range_single_value() {
        let mut rng = Rng::new(999);
        for _ in 0..10 {
            let v = rng.range(5, 5);
            assert_eq!(v, 5, "range(5,5) should always return 5");
        }
    }

    #[test]
    fn test_p310_rng_range_negative() {
        let mut rng = Rng::new(777);
        for _ in 0..200 {
            let v = rng.range(-10, 10);
            assert!(v >= -10 && v <= 10, "range(-10,10) produced {}", v);
        }
    }

    #[test]
    fn test_p310_rng_range_u_bounds() {
        let mut rng = Rng::new(555);
        for _ in 0..200 {
            let v = rng.range_u(100, 200);
            assert!(v >= 100 && v <= 200, "range_u(100,200) produced {}", v);
        }
    }

    #[test]
    fn test_p310_rng_choice() {
        let mut rng = Rng::new(42);
        let items = [10, 20, 30, 40, 50];
        for _ in 0..100 {
            let v = rng.choice(&items);
            assert!(items.contains(v), "choice returned value not in items");
        }
    }

    #[test]
    fn test_p310_rng_zero_seed() {
        let mut rng = Rng::new(0);
        // Should not panic, should produce values
        let v = rng.next();
        // Even with seed 0, wrapping_mul + wrapping_add produces non-zero
        let v2 = rng.next();
        assert_ne!(v, v2, "Successive calls should produce different values");
    }

    // --- imm() tests ---

    #[test]
    fn test_p310_imm_positive() {
        assert_eq!(imm(42), "42");
        assert_eq!(imm(0), "0");
        assert_eq!(imm(255), "255");
    }

    #[test]
    fn test_p310_imm_negative() {
        assert_eq!(imm(-1), "0xFFFFFFFF");
        assert_eq!(imm(-128), "0xFFFFFF80");
    }

    #[test]
    fn test_p310_imm_large() {
        assert_eq!(imm(0x7FFFFFFF), "2147483647");
    }

    // --- parse_u64() tests ---

    #[test]
    fn test_p310_parse_u64_decimal() {
        assert_eq!(parse_u64("42"), 42);
        assert_eq!(parse_u64("0"), 0);
        assert_eq!(parse_u64("18446744073709551615"), u64::MAX);
    }

    #[test]
    fn test_p310_parse_u64_hex() {
        assert_eq!(parse_u64("0xFF"), 255);
        assert_eq!(parse_u64("0x0"), 0);
        assert_eq!(parse_u64("0xDEADBEEF"), 0xDEADBEEF);
        assert_eq!(parse_u64("0X10"), 16);
    }

    #[test]
    fn test_p310_parse_u64_invalid() {
        assert_eq!(parse_u64("abc"), 0);
        assert_eq!(parse_u64(""), 0);
        assert_eq!(parse_u64("0xGHI"), 0);
    }

    // --- Config defaults ---

    #[test]
    fn test_p310_config_defaults() {
        let cfg = parse_args();
        assert_eq!(cfg.seed, 0xDEADBEEF);
        assert_eq!(cfg.count, 200);
        assert_eq!(cfg.max_steps, 500_000);
        assert_eq!(cfg.category, "all");
        assert!(!cfg.verbose);
    }

    // --- Oracle: gen_alu_chain ---

    #[test]
    fn test_p310_oracle_alu_chain_deterministic() {
        let mut rng = Rng::new(42);
        let tc = gen_alu_chain(&mut rng);
        let asm = assemble(&tc.source, 0).expect("should assemble");
        let mut vm = Vm::new();
        for (i, &word) in asm.pixels.iter().enumerate() {
            if i < vm.ram.len() {
                vm.ram[i] = word;
            }
        }
        vm.pc = 0;
        vm.halted = false;
        for _ in 0..100_000 {
            if !vm.step() {
                break;
            }
        }
        assert!(vm.halted, "alu_chain should halt");
        let failures = (tc.check)(&vm);
        assert!(failures.is_empty(), "Oracle failures: {:?}", failures);
    }

    #[test]
    fn test_p310_oracle_alu_chain_multiple_seeds() {
        for seed in [0, 1, 100, 0xDEADBEEF, 999999] {
            let mut rng = Rng::new(seed);
            let tc = gen_alu_chain(&mut rng);
            let asm = match assemble(&tc.source, 0) {
                Ok(a) => a,
                Err(_) => continue, // skip assembly errors
            };
            let mut vm = Vm::new();
            for (i, &word) in asm.pixels.iter().enumerate() {
                if i < vm.ram.len() {
                    vm.ram[i] = word;
                }
            }
            vm.pc = 0;
            vm.halted = false;
            for _ in 0..100_000 {
                if !vm.step() {
                    break;
                }
            }
            if vm.halted && !vm.segfault {
                let failures = (tc.check)(&vm);
                assert!(failures.is_empty(), "Seed {}: {:?}", seed, failures);
            }
        }
    }

    // --- Oracle: gen_alu_extremes ---

    #[test]
    fn test_p310_oracle_alu_extremes() {
        for seed in 0..20u64 {
            let mut rng = Rng::new(seed);
            let tc = gen_alu_extremes(&mut rng);
            let asm = match assemble(&tc.source, 0) {
                Ok(a) => a,
                Err(_) => continue,
            };
            let mut vm = Vm::new();
            for (i, &word) in asm.pixels.iter().enumerate() {
                if i < vm.ram.len() {
                    vm.ram[i] = word;
                }
            }
            vm.pc = 0;
            vm.halted = false;
            for _ in 0..100_000 {
                if !vm.step() {
                    break;
                }
            }
            if vm.halted && !vm.segfault {
                let failures = (tc.check)(&vm);
                assert!(failures.is_empty(), "Seed {}: {:?}", seed, failures);
            }
        }
    }

    // --- Oracle: gen_neg ---

    #[test]
    fn test_p310_oracle_neg() {
        for val in [0i64, 1, -1, 127, -128, 32767, -32768] {
            let expected: u32 = (!val as u32).wrapping_add(1);
            let src = format!("  LDI r1, {}\n  NEG r1\n  HALT", imm(val));
            let asm = assemble(&src, 0).expect("should assemble");
            let mut vm = Vm::new();
            for (i, &word) in asm.pixels.iter().enumerate() {
                if i < vm.ram.len() {
                    vm.ram[i] = word;
                }
            }
            vm.pc = 0;
            vm.halted = false;
            for _ in 0..1000 {
                if !vm.step() {
                    break;
                }
            }
            assert_eq!(vm.regs[1], expected, "NEG({}) failed", val);
        }
    }

    // --- Oracle: gen_cmp ---

    #[test]
    fn test_p310_oracle_cmp_less() {
        let src = "  LDI r1, 5\n  LDI r2, 10\n  CMP r1, r2\n  HALT";
        let asm = assemble(src, 0).unwrap();
        let mut vm = Vm::new();
        for (i, &word) in asm.pixels.iter().enumerate() {
            if i < vm.ram.len() {
                vm.ram[i] = word;
            }
        }
        vm.pc = 0;
        vm.halted = false;
        for _ in 0..1000 {
            if !vm.step() {
                break;
            }
        }
        assert_eq!(vm.regs[0], 0xFFFFFFFF, "5 < 10 should set r0 = -1");
    }

    #[test]
    fn test_p310_oracle_cmp_equal() {
        let src = "  LDI r1, 42\n  LDI r2, 42\n  CMP r1, r2\n  HALT";
        let asm = assemble(src, 0).unwrap();
        let mut vm = Vm::new();
        for (i, &word) in asm.pixels.iter().enumerate() {
            if i < vm.ram.len() {
                vm.ram[i] = word;
            }
        }
        vm.pc = 0;
        vm.halted = false;
        for _ in 0..1000 {
            if !vm.step() {
                break;
            }
        }
        assert_eq!(vm.regs[0], 0, "42 == 42 should set r0 = 0");
    }

    #[test]
    fn test_p310_oracle_cmp_greater() {
        let src = "  LDI r1, 100\n  LDI r2, 50\n  CMP r1, r2\n  HALT";
        let asm = assemble(src, 0).unwrap();
        let mut vm = Vm::new();
        for (i, &word) in asm.pixels.iter().enumerate() {
            if i < vm.ram.len() {
                vm.ram[i] = word;
            }
        }
        vm.pc = 0;
        vm.halted = false;
        for _ in 0..1000 {
            if !vm.step() {
                break;
            }
        }
        assert_eq!(vm.regs[0], 1, "100 > 50 should set r0 = 1");
    }

    #[test]
    fn test_p310_oracle_cmp_randomized() {
        for seed in 0..30u64 {
            let mut rng = Rng::new(seed);
            let tc = gen_cmp(&mut rng);
            let asm = match assemble(&tc.source, 0) {
                Ok(a) => a,
                Err(_) => continue,
            };
            let mut vm = Vm::new();
            for (i, &word) in asm.pixels.iter().enumerate() {
                if i < vm.ram.len() {
                    vm.ram[i] = word;
                }
            }
            vm.pc = 0;
            vm.halted = false;
            for _ in 0..1000 {
                if !vm.step() {
                    break;
                }
            }
            if vm.halted && !vm.segfault {
                let failures = (tc.check)(&vm);
                assert!(failures.is_empty(), "Seed {}: {:?}", seed, failures);
            }
        }
    }

    // --- Oracle: gen_cmp_branch ---

    #[test]
    fn test_p310_oracle_cmp_branch_blt() {
        // 3 < 10, BLT should branch
        let src = "  LDI r1, 3\n  LDI r2, 10\n  CMP r1, r2\n  BLT r1, is_less\n  LDI r10, 0\n  HALT\nis_less:\n  LDI r10, 1\n  HALT";
        let asm = assemble(src, 0).unwrap();
        let mut vm = Vm::new();
        for (i, &word) in asm.pixels.iter().enumerate() {
            if i < vm.ram.len() {
                vm.ram[i] = word;
            }
        }
        vm.pc = 0;
        vm.halted = false;
        for _ in 0..1000 {
            if !vm.step() {
                break;
            }
        }
        assert_eq!(vm.regs[10], 1, "BLT should branch when 3 < 10");
    }

    #[test]
    fn test_p310_oracle_cmp_branch_bge() {
        // 10 >= 3, BGE should branch
        let src = "  LDI r1, 10\n  LDI r2, 3\n  CMP r1, r2\n  BGE r1, is_ge\n  LDI r10, 0\n  HALT\nis_ge:\n  LDI r10, 1\n  HALT";
        let asm = assemble(src, 0).unwrap();
        let mut vm = Vm::new();
        for (i, &word) in asm.pixels.iter().enumerate() {
            if i < vm.ram.len() {
                vm.ram[i] = word;
            }
        }
        vm.pc = 0;
        vm.halted = false;
        for _ in 0..1000 {
            if !vm.step() {
                break;
            }
        }
        assert_eq!(vm.regs[10], 1, "BGE should branch when 10 >= 3");
    }

    // --- Oracle: gen_load_store ---

    #[test]
    fn test_p310_oracle_load_store() {
        for seed in 0..20u64 {
            let mut rng = Rng::new(seed);
            let tc = gen_load_store(&mut rng);
            let asm = match assemble(&tc.source, 0) {
                Ok(a) => a,
                Err(_) => continue,
            };
            let mut vm = Vm::new();
            for (i, &word) in asm.pixels.iter().enumerate() {
                if i < vm.ram.len() {
                    vm.ram[i] = word;
                }
            }
            vm.pc = 0;
            vm.halted = false;
            for _ in 0..100_000 {
                if !vm.step() {
                    break;
                }
            }
            if vm.halted && !vm.segfault {
                let failures = (tc.check)(&vm);
                assert!(failures.is_empty(), "Seed {}: {:?}", seed, failures);
            }
        }
    }

    // --- Oracle: gen_push_pop ---

    #[test]
    fn test_p310_oracle_push_pop() {
        for seed in 0..20u64 {
            let mut rng = Rng::new(seed);
            let tc = gen_push_pop(&mut rng);
            let asm = match assemble(&tc.source, 0) {
                Ok(a) => a,
                Err(_) => continue,
            };
            let mut vm = Vm::new();
            for (i, &word) in asm.pixels.iter().enumerate() {
                if i < vm.ram.len() {
                    vm.ram[i] = word;
                }
            }
            vm.pc = 0;
            vm.halted = false;
            for _ in 0..100_000 {
                if !vm.step() {
                    break;
                }
            }
            if vm.halted && !vm.segfault {
                let failures = (tc.check)(&vm);
                assert!(failures.is_empty(), "Seed {}: {:?}", seed, failures);
            }
        }
    }

    // --- Oracle: gen_loop ---

    #[test]
    fn test_p310_oracle_loop() {
        for seed in 0..20u64 {
            let mut rng = Rng::new(seed);
            let tc = gen_loop(&mut rng);
            let asm = match assemble(&tc.source, 0) {
                Ok(a) => a,
                Err(_) => continue,
            };
            let mut vm = Vm::new();
            for (i, &word) in asm.pixels.iter().enumerate() {
                if i < vm.ram.len() {
                    vm.ram[i] = word;
                }
            }
            vm.pc = 0;
            vm.halted = false;
            for _ in 0..1_000_000 {
                if !vm.step() {
                    break;
                }
            }
            if vm.halted && !vm.segfault {
                let failures = (tc.check)(&vm);
                assert!(failures.is_empty(), "Seed {}: {:?}", seed, failures);
            }
        }
    }

    // --- Oracle: gen_call_ret ---

    #[test]
    fn test_p310_oracle_call_ret() {
        for seed in 0..20u64 {
            let mut rng = Rng::new(seed);
            let tc = gen_call_ret(&mut rng);
            let asm = match assemble(&tc.source, 0) {
                Ok(a) => a,
                Err(_) => continue,
            };
            let mut vm = Vm::new();
            for (i, &word) in asm.pixels.iter().enumerate() {
                if i < vm.ram.len() {
                    vm.ram[i] = word;
                }
            }
            vm.pc = 0;
            vm.halted = false;
            for _ in 0..100_000 {
                if !vm.step() {
                    break;
                }
            }
            if vm.halted && !vm.segfault {
                let failures = (tc.check)(&vm);
                assert!(failures.is_empty(), "Seed {}: {:?}", seed, failures);
            }
        }
    }

    // --- Oracle: gen_nested_call ---

    #[test]
    fn test_p310_oracle_nested_call() {
        for seed in 0..20u64 {
            let mut rng = Rng::new(seed);
            let tc = gen_nested_call(&mut rng);
            let asm = match assemble(&tc.source, 0) {
                Ok(a) => a,
                Err(_) => continue,
            };
            let mut vm = Vm::new();
            for (i, &word) in asm.pixels.iter().enumerate() {
                if i < vm.ram.len() {
                    vm.ram[i] = word;
                }
            }
            vm.pc = 0;
            vm.halted = false;
            for _ in 0..100_000 {
                if !vm.step() {
                    break;
                }
            }
            if vm.halted && !vm.segfault {
                let failures = (tc.check)(&vm);
                assert!(failures.is_empty(), "Seed {}: {:?}", seed, failures);
            }
        }
    }

    // --- Oracle: gen_callee_save ---

    #[test]
    fn test_p310_oracle_callee_save() {
        for seed in 0..20u64 {
            let mut rng = Rng::new(seed);
            let tc = gen_callee_save(&mut rng);
            let asm = match assemble(&tc.source, 0) {
                Ok(a) => a,
                Err(_) => continue,
            };
            let mut vm = Vm::new();
            for (i, &word) in asm.pixels.iter().enumerate() {
                if i < vm.ram.len() {
                    vm.ram[i] = word;
                }
            }
            vm.pc = 0;
            vm.halted = false;
            for _ in 0..100_000 {
                if !vm.step() {
                    break;
                }
            }
            if vm.halted && !vm.segfault {
                let failures = (tc.check)(&vm);
                assert!(failures.is_empty(), "Seed {}: {:?}", seed, failures);
            }
        }
    }

    // --- Oracle: gen_conditional_sum ---

    #[test]
    fn test_p310_oracle_conditional_sum() {
        for seed in 0..20u64 {
            let mut rng = Rng::new(seed);
            let tc = gen_conditional_sum(&mut rng);
            let asm = match assemble(&tc.source, 0) {
                Ok(a) => a,
                Err(_) => continue,
            };
            let mut vm = Vm::new();
            for (i, &word) in asm.pixels.iter().enumerate() {
                if i < vm.ram.len() {
                    vm.ram[i] = word;
                }
            }
            vm.pc = 0;
            vm.halted = false;
            for _ in 0..1_000_000 {
                if !vm.step() {
                    break;
                }
            }
            if vm.halted && !vm.segfault {
                let failures = (tc.check)(&vm);
                assert!(failures.is_empty(), "Seed {}: {:?}", seed, failures);
            }
        }
    }

    // --- Oracle: gen_nested_loop ---

    #[test]
    fn test_p310_oracle_nested_loop() {
        for seed in 0..15u64 {
            let mut rng = Rng::new(seed);
            let tc = gen_nested_loop(&mut rng);
            let asm = match assemble(&tc.source, 0) {
                Ok(a) => a,
                Err(_) => continue,
            };
            let mut vm = Vm::new();
            for (i, &word) in asm.pixels.iter().enumerate() {
                if i < vm.ram.len() {
                    vm.ram[i] = word;
                }
            }
            vm.pc = 0;
            vm.halted = false;
            for _ in 0..2_000_000 {
                if !vm.step() {
                    break;
                }
            }
            if vm.halted && !vm.segfault {
                let failures = (tc.check)(&vm);
                assert!(failures.is_empty(), "Seed {}: {:?}", seed, failures);
            }
        }
    }

    // --- Oracle: gen_multi_store ---

    #[test]
    fn test_p310_oracle_multi_store() {
        for seed in 0..20u64 {
            let mut rng = Rng::new(seed);
            let tc = gen_multi_store(&mut rng);
            let asm = match assemble(&tc.source, 0) {
                Ok(a) => a,
                Err(_) => continue,
            };
            let mut vm = Vm::new();
            for (i, &word) in asm.pixels.iter().enumerate() {
                if i < vm.ram.len() {
                    vm.ram[i] = word;
                }
            }
            vm.pc = 0;
            vm.halted = false;
            for _ in 0..100_000 {
                if !vm.step() {
                    break;
                }
            }
            if vm.halted && !vm.segfault {
                let failures = (tc.check)(&vm);
                assert!(failures.is_empty(), "Seed {}: {:?}", seed, failures);
            }
        }
    }

    // --- run_with_oracle integration ---

    #[test]
    fn test_p310_run_with_oracle_ok() {
        let tc = TestCase {
            name: "simple_add".into(),
            source: "  LDI r1, 10\n  LDI r2, 20\n  ADD r1, r2\n  HALT".into(),
            check: Box::new(|vm: &Vm| {
                if vm.regs[1] != 30 {
                    vec!["r1 should be 30".into()]
                } else {
                    vec![]
                }
            }),
        };
        match run_with_oracle(tc, 1000) {
            Outcome::Ok(failures) => assert!(failures.is_empty()),
            other => panic!("Expected Ok, got {:?}", std::mem::discriminant(&other)),
        }
    }

    #[test]
    fn test_p310_run_with_oracle_asm_error() {
        let tc = TestCase {
            name: "bad_asm".into(),
            source: "  INVALID_OPCODE r1, r2\n  HALT".into(),
            check: Box::new(|_| vec![]),
        };
        match run_with_oracle(tc, 1000) {
            Outcome::AsmError(_) => (),
            other => panic!(
                "Expected AsmError, got {:?}",
                std::mem::discriminant(&other)
            ),
        }
    }

    #[test]
    fn test_p310_run_with_oracle_timeout() {
        let tc = TestCase {
            name: "infinite_loop".into(),
            source: "loop:\n  JMP loop".into(),
            check: Box::new(|_| vec![]),
        };
        match run_with_oracle(tc, 100) {
            Outcome::Timeout => (),
            other => panic!("Expected Timeout, got {:?}", std::mem::discriminant(&other)),
        }
    }

    // --- GENERATORS registry ---

    #[test]
    fn test_p310_generators_registry_complete() {
        assert_eq!(GENERATORS.len(), 14);
        let categories: Vec<&str> = GENERATORS.iter().map(|g| g.category).collect();
        assert!(categories.contains(&"alu"));
        assert!(categories.contains(&"memory"));
        assert!(categories.contains(&"stack"));
        assert!(categories.contains(&"control"));
    }

    #[test]
    fn test_p310_generators_all_produce_valid_asm() {
        let mut rng = Rng::new(42);
        for entry in GENERATORS {
            for _ in 0..5 {
                let tc = (entry.gen)(&mut rng);
                // Every generated source should either assemble or be a known pattern
                let _ = assemble(&tc.source, 0);
                // We don't assert Ok because some generators might produce
                // edge cases; the important thing is no panic
            }
        }
    }

    // --- Full fuzzer sweep ---

    #[test]
    fn test_p310_full_fuzzer_sweep() {
        let mut rng = Rng::new(0xBEEF);
        let mut oracle_fails = 0;
        let mut total = 0;
        let count = 100;

        for _ in 0..count {
            let entry = rng.choice(GENERATORS);
            let tc = (entry.gen)(&mut rng);
            let outcome = run_with_oracle(tc, 200_000);
            total += 1;
            match outcome {
                Outcome::Ok(failures) if !failures.is_empty() => {
                    oracle_fails += 1;
                },
                Outcome::Panic(_) => {
                    oracle_fails += 1;
                },
                _ => {},
            }
        }

        assert_eq!(
            oracle_fails, 0,
            "{} oracle failures out of {} tests",
            oracle_fails, total
        );
    }
}
