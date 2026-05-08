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
;   r12: CMP result (reserved)
;   r6: Key input
;   r1: Constant 1
;   r2: State (0=idle, 1=thinking, 2=result)

; ===== Initialize =====
LDI r1, 1
LDI r2, 0            ; state: idle

; Title
LDI r9, 0x3800
STRO r9, "ORACLE ARCHITECT v1.0"

; Build the Oracle prompt
LDI r9, 0x3900
STRO r9, "You are the Geometry OS Oracle. Read the roadmap state below. Which planned phase to build next? Reply with just the phase ID and a one-line reason."

; Status
LDI r9, 0x3700
STRO r9, "SPACE=ask Oracle"

; ===== Main Loop =====
main_loop:
    FILL r12

    ; -- Title bar --
    LDI r9, 0x1A0066    ; oracle purple
    LDI r10, 0
    LDI r5, 0
    LDI r8, 256
    LDI r16, 8
    RECTF r10, r5, r8, r16, r9

    ; Title text
    LDI r10, 2
    LDI r5, 1
    LDI r8, 0x3800
    TEXT r10, r5, r8

    ; -- Separator --
    LDI r9, 0x333355
    LDI r10, 0
    LDI r5, 9
    LDI r8, 256
    LDI r16, 1
    RECTF r10, r5, r8, r16, r9

    ; -- State dispatch --
    JNZ r2, not_idle
    JMP state_idle
not_idle:
    LDI r20, 1
    SUB r20, r2, r20
    JNZ r20, not_thinking
    JMP state_thinking
not_thinking:
    JMP state_result

state_idle:
    ; Show roadmap summary
    LDI r10, 2
    LDI r5, 12
    LDI r8, 0x3000
    TEXT r10, r5, r8

    ; Status
    LDI r10, 2
    LDI r5, 28
    LDI r8, 0x3700
    TEXT r10, r5, r8

    ; Wait for SPACE
    IKEY r6
    LDI r9, 32
    CMP r6, r9
    JNZ r12, main_loop

    ; SPACE pressed -- call Oracle
    LDI r2, 1
    LDI r9, 0x3700
    STRO r9, "Oracle thinking..."
    JMP main_loop

state_thinking:
    ; Call LLM: prompt from 0x3900, response to 0x3300, max 768 bytes
    LDI r15, 0x3900
    LDI r11, 0x3300
    LDI r14, 768
    LLM r15, r11, r14

    ; r12 = response length (0 = error)
    JNZ r12, oracle_ok

    ; Oracle failed
    LDI r2, 0
    LDI r9, 0x3700
    STRO r9, "Oracle silent. SPACE=retry"
    JMP main_loop

oracle_ok:
    LDI r2, 2
    LDI r9, 0x3700
    STRO r9, "SPACE=again  ESC=back"
    JMP main_loop

state_result:
    ; Show the Oracle's response
    LDI r10, 2
    LDI r5, 12
    LDI r8, 0x3300
    TEXT r10, r5, r8

    ; Status
    LDI r10, 2
    LDI r5, 28
    LDI r8, 0x3700
    TEXT r10, r5, r8

    ; Wait for key
    IKEY r6
    LDI r9, 32
    CMP r6, r9
    JNZ r12, check_esc
    ; SPACE = ask again
    LDI r2, 1
    LDI r9, 0x3700
    STRO r9, "Oracle thinking..."
    JMP main_loop

check_esc:
    LDI r9, 27
    CMP r6, r9
    JNZ r12, main_loop
    ; ESC = back to idle
    LDI r2, 0
    LDI r9, 0x3700
    STRO r9, "SPACE=ask Oracle"
    JMP main_loop
