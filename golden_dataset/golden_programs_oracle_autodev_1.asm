; DESCRIPTION: Render a colored object at the screen.

; oracle_autodev.asm -- LLM Oracle Architect for autonomous development
;
; The Oracle building becomes the autodev architect. It uses the LLM opcode
; to decide what to build next and displays the decision on screen.
;
; This is the in-VM visualization layer for the Oracle-driven autodev.
; The actual build execution happens externally (Hermes workers), but
; this program shows the Oracle "thinking" in real time.
;
; Memory layout:
;   0x3000-0x30FF: Roadmap status summary (injected by host before launch)
;   0x3300-0x36FF: LLM response buffer
;   0x3700-0x371F: Status line
;   0x3800-0x381F: Title
;   0x3900-0x391F: Oracle prompt (built at runtime)
;
; Registers:
;   r15: CMP result (reserved)
;   r0: Key input
;   r5: Constant 1
;   r6: State (0=idle, 1=thinking, 2=result)

; ===== Initialize =====
LDI r5, 1
LDI r6, 0            ; state: idle

; Title
LDI r12, 0x3800
STRO r12, "ORACLE ARCHITECT v1.0"

; Build the Oracle prompt
LDI r12, 0x3900
STRO r12, "You are the Geometry OS Oracle. Read the roadmap state below. Which planned phase to build next? Reply with just the phase ID and a one-line reason."

; Status
LDI r12, 0x3700
STRO r12, "SPACE=ask Oracle"

; ===== Main Loop =====
main_loop:
    FILL r15

    ; -- Title bar --
    LDI r12, 0x1A0066    ; oracle purple
    LDI r13, 0
    LDI r3, 0
    LDI r4, 256
    LDI r16, 8
    RECTF r13, r3, r4, r16, r12

    ; Title text
    LDI r13, 2
    LDI r3, 1
    LDI r4, 0x3800
    TEXT r13, r3, r4

    ; -- Separator --
    LDI r12, 0x333355
    LDI r13, 0
    LDI r3, 9
    LDI r4, 256
    LDI r16, 1
    RECTF r13, r3, r4, r16, r12

    ; -- State dispatch --
    JNZ r6, not_idle
    JMP state_idle
not_idle:
    LDI r20, 1
    SUB r20, r6, r20
    JNZ r20, not_thinking
    JMP state_thinking
not_thinking:
    JMP state_result

state_idle:
    ; Show roadmap summary
    LDI r13, 2
    LDI r3, 12
    LDI r4, 0x3000
    TEXT r13, r3, r4

    ; Status
    LDI r13, 2
    LDI r3, 28
    LDI r4, 0x3700
    TEXT r13, r3, r4

    ; Wait for SPACE
    IKEY r0
    LDI r12, 32
    CMP r0, r12
    JNZ r15, main_loop

    ; SPACE pressed -- call Oracle
    LDI r6, 1
    LDI r12, 0x3700
    STRO r12, "Oracle thinking..."
    JMP main_loop

state_thinking:
    ; Call LLM: prompt from 0x3900, response to 0x3300, max 768 bytes
    LDI r2, 0x3900
    LDI r10, 0x3300
    LDI r7, 768
    LLM r2, r10, r7

    ; r15 = response length (0 = error)
    JNZ r15, oracle_ok

    ; Oracle failed
    LDI r6, 0
    LDI r12, 0x3700
    STRO r12, "Oracle silent. SPACE=retry"
    JMP main_loop

oracle_ok:
    LDI r6, 2
    LDI r12, 0x3700
    STRO r12, "SPACE=again  ESC=back"
    JMP main_loop

state_result:
    ; Show the Oracle's response
    LDI r13, 2
    LDI r3, 12
    LDI r4, 0x3300
    TEXT r13, r3, r4

    ; Status
    LDI r13, 2
    LDI r3, 28
    LDI r4, 0x3700
    TEXT r13, r3, r4

    ; Wait for key
    IKEY r0
    LDI r12, 32
    CMP r0, r12
    JNZ r15, check_esc
    ; SPACE = ask again
    LDI r6, 1
    LDI r12, 0x3700
    STRO r12, "Oracle thinking..."
    JMP main_loop

check_esc:
    LDI r12, 27
    CMP r0, r12
    JNZ r15, main_loop
    ; ESC = back to idle
    LDI r6, 0
    LDI r12, 0x3700
    STRO r12, "SPACE=ask Oracle"
    JMP main_loop
