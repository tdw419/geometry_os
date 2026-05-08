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
;   r5: CMP result (reserved)
;   r1: Key input
;   r14: Constant 1
;   r10: State (0=idle, 1=thinking, 2=result)

; ===== Initialize =====
LDI r14, 1
LDI r10, 0            ; state: idle

; Title
LDI r6, 0x3800
STRO r6, "ORACLE ARCHITECT v1.0"

; Build the Oracle prompt
LDI r6, 0x3900
STRO r6, "You are the Geometry OS Oracle. Read the roadmap state below. Which planned phase to build next? Reply with just the phase ID and a one-line reason."

; Status
LDI r6, 0x3700
STRO r6, "SPACE=ask Oracle"

; ===== Main Loop =====
main_loop:
    FILL r5

    ; -- Title bar --
    LDI r6, 0x1A0066    ; oracle purple
    LDI r8, 0
    LDI r4, 0
    LDI r3, 256
    LDI r16, 8
    RECTF r8, r4, r3, r16, r6

    ; Title text
    LDI r8, 2
    LDI r4, 1
    LDI r3, 0x3800
    TEXT r8, r4, r3

    ; -- Separator --
    LDI r6, 0x333355
    LDI r8, 0
    LDI r4, 9
    LDI r3, 256
    LDI r16, 1
    RECTF r8, r4, r3, r16, r6

    ; -- State dispatch --
    JNZ r10, not_idle
    JMP state_idle
not_idle:
    LDI r20, 1
    SUB r20, r10, r20
    JNZ r20, not_thinking
    JMP state_thinking
not_thinking:
    JMP state_result

state_idle:
    ; Show roadmap summary
    LDI r8, 2
    LDI r4, 12
    LDI r3, 0x3000
    TEXT r8, r4, r3

    ; Status
    LDI r8, 2
    LDI r4, 28
    LDI r3, 0x3700
    TEXT r8, r4, r3

    ; Wait for SPACE
    IKEY r1
    LDI r6, 32
    CMP r1, r6
    JNZ r5, main_loop

    ; SPACE pressed -- call Oracle
    LDI r10, 1
    LDI r6, 0x3700
    STRO r6, "Oracle thinking..."
    JMP main_loop

state_thinking:
    ; Call LLM: prompt from 0x3900, response to 0x3300, max 768 bytes
    LDI r7, 0x3900
    LDI r9, 0x3300
    LDI r12, 768
    LLM r7, r9, r12

    ; r5 = response length (0 = error)
    JNZ r5, oracle_ok

    ; Oracle failed
    LDI r10, 0
    LDI r6, 0x3700
    STRO r6, "Oracle silent. SPACE=retry"
    JMP main_loop

oracle_ok:
    LDI r10, 2
    LDI r6, 0x3700
    STRO r6, "SPACE=again  ESC=back"
    JMP main_loop

state_result:
    ; Show the Oracle's response
    LDI r8, 2
    LDI r4, 12
    LDI r3, 0x3300
    TEXT r8, r4, r3

    ; Status
    LDI r8, 2
    LDI r4, 28
    LDI r3, 0x3700
    TEXT r8, r4, r3

    ; Wait for key
    IKEY r1
    LDI r6, 32
    CMP r1, r6
    JNZ r5, check_esc
    ; SPACE = ask again
    LDI r10, 1
    LDI r6, 0x3700
    STRO r6, "Oracle thinking..."
    JMP main_loop

check_esc:
    LDI r6, 27
    CMP r1, r6
    JNZ r5, main_loop
    ; ESC = back to idle
    LDI r10, 0
    LDI r6, 0x3700
    STRO r6, "SPACE=ask Oracle"
    JMP main_loop
