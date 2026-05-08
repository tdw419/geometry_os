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
;   r2: CMP result (reserved)
;   r12: Key input
;   r10: Constant 1
;   r5: State (0=idle, 1=thinking, 2=result)

; ===== Initialize =====
LDI r10, 1
LDI r5, 0            ; state: idle

; Title
LDI r8, 0x3800
STRO r8, "ORACLE ARCHITECT v1.0"

; Build the Oracle prompt
LDI r8, 0x3900
STRO r8, "You are the Geometry OS Oracle. Read the roadmap state below. Which planned phase to build next? Reply with just the phase ID and a one-line reason."

; Status
LDI r8, 0x3700
STRO r8, "SPACE=ask Oracle"

; ===== Main Loop =====
main_loop:
    FILL r2

    ; -- Title bar --
    LDI r8, 0x1A0066    ; oracle purple
    LDI r6, 0
    LDI r15, 0
    LDI r1, 256
    LDI r16, 8
    RECTF r6, r15, r1, r16, r8

    ; Title text
    LDI r6, 2
    LDI r15, 1
    LDI r1, 0x3800
    TEXT r6, r15, r1

    ; -- Separator --
    LDI r8, 0x333355
    LDI r6, 0
    LDI r15, 9
    LDI r1, 256
    LDI r16, 1
    RECTF r6, r15, r1, r16, r8

    ; -- State dispatch --
    JNZ r5, not_idle
    JMP state_idle
not_idle:
    LDI r20, 1
    SUB r20, r5, r20
    JNZ r20, not_thinking
    JMP state_thinking
not_thinking:
    JMP state_result

state_idle:
    ; Show roadmap summary
    LDI r6, 2
    LDI r15, 12
    LDI r1, 0x3000
    TEXT r6, r15, r1

    ; Status
    LDI r6, 2
    LDI r15, 28
    LDI r1, 0x3700
    TEXT r6, r15, r1

    ; Wait for SPACE
    IKEY r12
    LDI r8, 32
    CMP r12, r8
    JNZ r2, main_loop

    ; SPACE pressed -- call Oracle
    LDI r5, 1
    LDI r8, 0x3700
    STRO r8, "Oracle thinking..."
    JMP main_loop

state_thinking:
    ; Call LLM: prompt from 0x3900, response to 0x3300, max 768 bytes
    LDI r9, 0x3900
    LDI r3, 0x3300
    LDI r7, 768
    LLM r9, r3, r7

    ; r2 = response length (0 = error)
    JNZ r2, oracle_ok

    ; Oracle failed
    LDI r5, 0
    LDI r8, 0x3700
    STRO r8, "Oracle silent. SPACE=retry"
    JMP main_loop

oracle_ok:
    LDI r5, 2
    LDI r8, 0x3700
    STRO r8, "SPACE=again  ESC=back"
    JMP main_loop

state_result:
    ; Show the Oracle's response
    LDI r6, 2
    LDI r15, 12
    LDI r1, 0x3300
    TEXT r6, r15, r1

    ; Status
    LDI r6, 2
    LDI r15, 28
    LDI r1, 0x3700
    TEXT r6, r15, r1

    ; Wait for key
    IKEY r12
    LDI r8, 32
    CMP r12, r8
    JNZ r2, check_esc
    ; SPACE = ask again
    LDI r5, 1
    LDI r8, 0x3700
    STRO r8, "Oracle thinking..."
    JMP main_loop

check_esc:
    LDI r8, 27
    CMP r12, r8
    JNZ r2, main_loop
    ; ESC = back to idle
    LDI r5, 0
    LDI r8, 0x3700
    STRO r8, "SPACE=ask Oracle"
    JMP main_loop
