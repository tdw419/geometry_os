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
;   r11: CMP result (reserved)
;   r15: Key input
;   r6: Constant 1
;   r8: State (0=idle, 1=thinking, 2=result)

; ===== Initialize =====
LDI r6, 1
LDI r8, 0            ; state: idle

; Title
LDI r2, 0x3800
STRO r2, "ORACLE ARCHITECT v1.0"

; Build the Oracle prompt
LDI r2, 0x3900
STRO r2, "You are the Geometry OS Oracle. Read the roadmap state below. Which planned phase to build next? Reply with just the phase ID and a one-line reason."

; Status
LDI r2, 0x3700
STRO r2, "SPACE=ask Oracle"

; ===== Main Loop =====
main_loop:
    FILL r11

    ; -- Title bar --
    LDI r2, 0x1A0066    ; oracle purple
    LDI r12, 0
    LDI r7, 0
    LDI r0, 256
    LDI r16, 8
    RECTF r12, r7, r0, r16, r2

    ; Title text
    LDI r12, 2
    LDI r7, 1
    LDI r0, 0x3800
    TEXT r12, r7, r0

    ; -- Separator --
    LDI r2, 0x333355
    LDI r12, 0
    LDI r7, 9
    LDI r0, 256
    LDI r16, 1
    RECTF r12, r7, r0, r16, r2

    ; -- State dispatch --
    JNZ r8, not_idle
    JMP state_idle
not_idle:
    LDI r20, 1
    SUB r20, r8, r20
    JNZ r20, not_thinking
    JMP state_thinking
not_thinking:
    JMP state_result

state_idle:
    ; Show roadmap summary
    LDI r12, 2
    LDI r7, 12
    LDI r0, 0x3000
    TEXT r12, r7, r0

    ; Status
    LDI r12, 2
    LDI r7, 28
    LDI r0, 0x3700
    TEXT r12, r7, r0

    ; Wait for SPACE
    IKEY r15
    LDI r2, 32
    CMP r15, r2
    JNZ r11, main_loop

    ; SPACE pressed -- call Oracle
    LDI r8, 1
    LDI r2, 0x3700
    STRO r2, "Oracle thinking..."
    JMP main_loop

state_thinking:
    ; Call LLM: prompt from 0x3900, response to 0x3300, max 768 bytes
    LDI r9, 0x3900
    LDI r14, 0x3300
    LDI r13, 768
    LLM r9, r14, r13

    ; r11 = response length (0 = error)
    JNZ r11, oracle_ok

    ; Oracle failed
    LDI r8, 0
    LDI r2, 0x3700
    STRO r2, "Oracle silent. SPACE=retry"
    JMP main_loop

oracle_ok:
    LDI r8, 2
    LDI r2, 0x3700
    STRO r2, "SPACE=again  ESC=back"
    JMP main_loop

state_result:
    ; Show the Oracle's response
    LDI r12, 2
    LDI r7, 12
    LDI r0, 0x3300
    TEXT r12, r7, r0

    ; Status
    LDI r12, 2
    LDI r7, 28
    LDI r0, 0x3700
    TEXT r12, r7, r0

    ; Wait for key
    IKEY r15
    LDI r2, 32
    CMP r15, r2
    JNZ r11, check_esc
    ; SPACE = ask again
    LDI r8, 1
    LDI r2, 0x3700
    STRO r2, "Oracle thinking..."
    JMP main_loop

check_esc:
    LDI r2, 27
    CMP r15, r2
    JNZ r11, main_loop
    ; ESC = back to idle
    LDI r8, 0
    LDI r2, 0x3700
    STRO r2, "SPACE=ask Oracle"
    JMP main_loop
