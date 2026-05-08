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
;   r2: CMP result (reserved)
;   r8: Key input
;   r6: Constant 1
;   r3: State (0=idle, 1=thinking, 2=result)

; ===== Initialize =====
LDI r6, 1
LDI r3, 0            ; state: idle

; Title
LDI r7, 0x3800
STRO r7, "ORACLE ARCHITECT v1.0"

; Build the Oracle prompt
LDI r7, 0x3900
STRO r7, "You are the Geometry OS Oracle. Read the roadmap state below. Which planned phase to build next? Reply with just the phase ID and a one-line reason."

; Status
LDI r7, 0x3700
STRO r7, "SPACE=ask Oracle"

; ===== Main Loop =====
main_loop:
    FILL r2

    ; -- Title bar --
    LDI r7, 0x1A0066    ; oracle purple
    LDI r13, 0
    LDI r11, 0
    LDI r5, 256
    LDI r16, 8
    RECTF r13, r11, r5, r16, r7

    ; Title text
    LDI r13, 2
    LDI r11, 1
    LDI r5, 0x3800
    TEXT r13, r11, r5

    ; -- Separator --
    LDI r7, 0x333355
    LDI r13, 0
    LDI r11, 9
    LDI r5, 256
    LDI r16, 1
    RECTF r13, r11, r5, r16, r7

    ; -- State dispatch --
    JNZ r3, not_idle
    JMP state_idle
not_idle:
    LDI r20, 1
    SUB r20, r3, r20
    JNZ r20, not_thinking
    JMP state_thinking
not_thinking:
    JMP state_result

state_idle:
    ; Show roadmap summary
    LDI r13, 2
    LDI r11, 12
    LDI r5, 0x3000
    TEXT r13, r11, r5

    ; Status
    LDI r13, 2
    LDI r11, 28
    LDI r5, 0x3700
    TEXT r13, r11, r5

    ; Wait for SPACE
    IKEY r8
    LDI r7, 32
    CMP r8, r7
    JNZ r2, main_loop

    ; SPACE pressed -- call Oracle
    LDI r3, 1
    LDI r7, 0x3700
    STRO r7, "Oracle thinking..."
    JMP main_loop

state_thinking:
    ; Call LLM: prompt from 0x3900, response to 0x3300, max 768 bytes
    LDI r15, 0x3900
    LDI r4, 0x3300
    LDI r1, 768
    LLM r15, r4, r1

    ; r2 = response length (0 = error)
    JNZ r2, oracle_ok

    ; Oracle failed
    LDI r3, 0
    LDI r7, 0x3700
    STRO r7, "Oracle silent. SPACE=retry"
    JMP main_loop

oracle_ok:
    LDI r3, 2
    LDI r7, 0x3700
    STRO r7, "SPACE=again  ESC=back"
    JMP main_loop

state_result:
    ; Show the Oracle's response
    LDI r13, 2
    LDI r11, 12
    LDI r5, 0x3300
    TEXT r13, r11, r5

    ; Status
    LDI r13, 2
    LDI r11, 28
    LDI r5, 0x3700
    TEXT r13, r11, r5

    ; Wait for key
    IKEY r8
    LDI r7, 32
    CMP r8, r7
    JNZ r2, check_esc
    ; SPACE = ask again
    LDI r3, 1
    LDI r7, 0x3700
    STRO r7, "Oracle thinking..."
    JMP main_loop

check_esc:
    LDI r7, 27
    CMP r8, r7
    JNZ r2, main_loop
    ; ESC = back to idle
    LDI r3, 0
    LDI r7, 0x3700
    STRO r7, "SPACE=ask Oracle"
    JMP main_loop
