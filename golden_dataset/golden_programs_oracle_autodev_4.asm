; DESCRIPTION: Draws a colored object at the screen with fixed size.

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
;   r14: CMP result (reserved)
;   r2: Key input
;   r4: Constant 1
;   r13: State (0=idle, 1=thinking, 2=result)

; ===== Initialize =====
LDI r4, 1
LDI r13, 0            ; state: idle

; Title
LDI r11, 0x3800
STRO r11, "ORACLE ARCHITECT v1.0"

; Build the Oracle prompt
LDI r11, 0x3900
STRO r11, "You are the Geometry OS Oracle. Read the roadmap state below. Which planned phase to build next? Reply with just the phase ID and a one-line reason."

; Status
LDI r11, 0x3700
STRO r11, "SPACE=ask Oracle"

; ===== Main Loop =====
main_loop:
    FILL r14

    ; -- Title bar --
    LDI r11, 0x1A0066    ; oracle purple
    LDI r9, 0
    LDI r5, 0
    LDI r1, 256
    LDI r16, 8
    RECTF r9, r5, r1, r16, r11

    ; Title text
    LDI r9, 2
    LDI r5, 1
    LDI r1, 0x3800
    TEXT r9, r5, r1

    ; -- Separator --
    LDI r11, 0x333355
    LDI r9, 0
    LDI r5, 9
    LDI r1, 256
    LDI r16, 1
    RECTF r9, r5, r1, r16, r11

    ; -- State dispatch --
    JNZ r13, not_idle
    JMP state_idle
not_idle:
    LDI r20, 1
    SUB r20, r13, r20
    JNZ r20, not_thinking
    JMP state_thinking
not_thinking:
    JMP state_result

state_idle:
    ; Show roadmap summary
    LDI r9, 2
    LDI r5, 12
    LDI r1, 0x3000
    TEXT r9, r5, r1

    ; Status
    LDI r9, 2
    LDI r5, 28
    LDI r1, 0x3700
    TEXT r9, r5, r1

    ; Wait for SPACE
    IKEY r2
    LDI r11, 32
    CMP r2, r11
    JNZ r14, main_loop

    ; SPACE pressed -- call Oracle
    LDI r13, 1
    LDI r11, 0x3700
    STRO r11, "Oracle thinking..."
    JMP main_loop

state_thinking:
    ; Call LLM: prompt from 0x3900, response to 0x3300, max 768 bytes
    LDI r10, 0x3900
    LDI r7, 0x3300
    LDI r8, 768
    LLM r10, r7, r8

    ; r14 = response length (0 = error)
    JNZ r14, oracle_ok

    ; Oracle failed
    LDI r13, 0
    LDI r11, 0x3700
    STRO r11, "Oracle silent. SPACE=retry"
    JMP main_loop

oracle_ok:
    LDI r13, 2
    LDI r11, 0x3700
    STRO r11, "SPACE=again  ESC=back"
    JMP main_loop

state_result:
    ; Show the Oracle's response
    LDI r9, 2
    LDI r5, 12
    LDI r1, 0x3300
    TEXT r9, r5, r1

    ; Status
    LDI r9, 2
    LDI r5, 28
    LDI r1, 0x3700
    TEXT r9, r5, r1

    ; Wait for key
    IKEY r2
    LDI r11, 32
    CMP r2, r11
    JNZ r14, check_esc
    ; SPACE = ask again
    LDI r13, 1
    LDI r11, 0x3700
    STRO r11, "Oracle thinking..."
    JMP main_loop

check_esc:
    LDI r11, 27
    CMP r2, r11
    JNZ r14, main_loop
    ; ESC = back to idle
    LDI r13, 0
    LDI r11, 0x3700
    STRO r11, "SPACE=ask Oracle"
    JMP main_loop
