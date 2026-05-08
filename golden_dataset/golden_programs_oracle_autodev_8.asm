; DESCRIPTION: This GeOS assembly code implements an interactive in-VM visualization layer for an autonomous development system driven by an Oracle. It initializes the environment, displays a title and prompt, and enters a loop where it waits for user input to trigger decision-making via a large language model (LLM). The program visualizes the Oracle's thought process in real-time and handles different states such as idle, thinking, and displaying results, with options to retry or go back.

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
;   r13: CMP result (reserved)
;   r3: Key input
;   r12: Constant 1
;   r5: State (0=idle, 1=thinking, 2=result)

; ===== Initialize =====
LDI r12, 1
LDI r5, 0            ; state: idle

; Title
LDI r4, 0x3800
STRO r4, "ORACLE ARCHITECT v1.0"

; Build the Oracle prompt
LDI r4, 0x3900
STRO r4, "You are the Geometry OS Oracle. Read the roadmap state below. Which planned phase to build next? Reply with just the phase ID and a one-line reason."

; Status
LDI r4, 0x3700
STRO r4, "SPACE=ask Oracle"

; ===== Main Loop =====
main_loop:
    FILL r13

    ; -- Title bar --
    LDI r4, 0x1A0066    ; oracle purple
    LDI r8, 0
    LDI r10, 0
    LDI r11, 256
    LDI r16, 8
    RECTF r8, r10, r11, r16, r4

    ; Title text
    LDI r8, 2
    LDI r10, 1
    LDI r11, 0x3800
    TEXT r8, r10, r11

    ; -- Separator --
    LDI r4, 0x333355
    LDI r8, 0
    LDI r10, 9
    LDI r11, 256
    LDI r16, 1
    RECTF r8, r10, r11, r16, r4

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
    LDI r8, 2
    LDI r10, 12
    LDI r11, 0x3000
    TEXT r8, r10, r11

    ; Status
    LDI r8, 2
    LDI r10, 28
    LDI r11, 0x3700
    TEXT r8, r10, r11

    ; Wait for SPACE
    IKEY r3
    LDI r4, 32
    CMP r3, r4
    JNZ r13, main_loop

    ; SPACE pressed -- call Oracle
    LDI r5, 1
    LDI r4, 0x3700
    STRO r4, "Oracle thinking..."
    JMP main_loop

state_thinking:
    ; Call LLM: prompt from 0x3900, response to 0x3300, max 768 bytes
    LDI r2, 0x3900
    LDI r9, 0x3300
    LDI r15, 768
    LLM r2, r9, r15

    ; r13 = response length (0 = error)
    JNZ r13, oracle_ok

    ; Oracle failed
    LDI r5, 0
    LDI r4, 0x3700
    STRO r4, "Oracle silent. SPACE=retry"
    JMP main_loop

oracle_ok:
    LDI r5, 2
    LDI r4, 0x3700
    STRO r4, "SPACE=again  ESC=back"
    JMP main_loop

state_result:
    ; Show the Oracle's response
    LDI r8, 2
    LDI r10, 12
    LDI r11, 0x3300
    TEXT r8, r10, r11

    ; Status
    LDI r8, 2
    LDI r10, 28
    LDI r11, 0x3700
    TEXT r8, r10, r11

    ; Wait for key
    IKEY r3
    LDI r4, 32
    CMP r3, r4
    JNZ r13, check_esc
    ; SPACE = ask again
    LDI r5, 1
    LDI r4, 0x3700
    STRO r4, "Oracle thinking..."
    JMP main_loop

check_esc:
    LDI r4, 27
    CMP r3, r4
    JNZ r13, main_loop
    ; ESC = back to idle
    LDI r5, 0
    LDI r4, 0x3700
    STRO r4, "SPACE=ask Oracle"
    JMP main_loop
