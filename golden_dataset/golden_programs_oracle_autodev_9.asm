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
;   r8: CMP result (reserved)
;   r2: Key input
;   r4: Constant 1
;   r3: State (0=idle, 1=thinking, 2=result)

; ===== Initialize =====
LDI r4, 1
LDI r3, 0            ; state: idle

; Title
LDI r1, 0x3800
STRO r1, "ORACLE ARCHITECT v1.0"

; Build the Oracle prompt
LDI r1, 0x3900
STRO r1, "You are the Geometry OS Oracle. Read the roadmap state below. Which planned phase to build next? Reply with just the phase ID and a one-line reason."

; Status
LDI r1, 0x3700
STRO r1, "SPACE=ask Oracle"

; ===== Main Loop =====
main_loop:
    FILL r8

    ; -- Title bar --
    LDI r1, 0x1A0066    ; oracle purple
    LDI r7, 0
    LDI r9, 0
    LDI r10, 256
    LDI r16, 8
    RECTF r7, r9, r10, r16, r1

    ; Title text
    LDI r7, 2
    LDI r9, 1
    LDI r10, 0x3800
    TEXT r7, r9, r10

    ; -- Separator --
    LDI r1, 0x333355
    LDI r7, 0
    LDI r9, 9
    LDI r10, 256
    LDI r16, 1
    RECTF r7, r9, r10, r16, r1

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
    LDI r7, 2
    LDI r9, 12
    LDI r10, 0x3000
    TEXT r7, r9, r10

    ; Status
    LDI r7, 2
    LDI r9, 28
    LDI r10, 0x3700
    TEXT r7, r9, r10

    ; Wait for SPACE
    IKEY r2
    LDI r1, 32
    CMP r2, r1
    JNZ r8, main_loop

    ; SPACE pressed -- call Oracle
    LDI r3, 1
    LDI r1, 0x3700
    STRO r1, "Oracle thinking..."
    JMP main_loop

state_thinking:
    ; Call LLM: prompt from 0x3900, response to 0x3300, max 768 bytes
    LDI r6, 0x3900
    LDI r14, 0x3300
    LDI r11, 768
    LLM r6, r14, r11

    ; r8 = response length (0 = error)
    JNZ r8, oracle_ok

    ; Oracle failed
    LDI r3, 0
    LDI r1, 0x3700
    STRO r1, "Oracle silent. SPACE=retry"
    JMP main_loop

oracle_ok:
    LDI r3, 2
    LDI r1, 0x3700
    STRO r1, "SPACE=again  ESC=back"
    JMP main_loop

state_result:
    ; Show the Oracle's response
    LDI r7, 2
    LDI r9, 12
    LDI r10, 0x3300
    TEXT r7, r9, r10

    ; Status
    LDI r7, 2
    LDI r9, 28
    LDI r10, 0x3700
    TEXT r7, r9, r10

    ; Wait for key
    IKEY r2
    LDI r1, 32
    CMP r2, r1
    JNZ r8, check_esc
    ; SPACE = ask again
    LDI r3, 1
    LDI r1, 0x3700
    STRO r1, "Oracle thinking..."
    JMP main_loop

check_esc:
    LDI r1, 27
    CMP r2, r1
    JNZ r8, main_loop
    ; ESC = back to idle
    LDI r3, 0
    LDI r1, 0x3700
    STRO r1, "SPACE=ask Oracle"
    JMP main_loop
