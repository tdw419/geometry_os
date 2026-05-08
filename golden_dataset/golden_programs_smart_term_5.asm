; DESCRIPTION: The GeOS assembly code implements a terminal interface with AI assistance. It allows users to type text and press Tab to send prompts to an external AI, displaying the response on screen. The code manages memory buffers for input, responses, and status messages, uses registers for various purposes including cursor position and constants, and includes functions for drawing text, handling keyboard input, and interacting with the AI via a specific opcode.

; smart_term.asm -- Terminal with AI assist
; Type text, press Tab to ask the LLM, response appears on screen.
; Uses LLM opcode (0x9C) to send prompts to external AI.
;
; Memory layout:
;   0x2000-0x20FF: Input buffer (prompt typed by user)
;   0x2100-0x24FF: Response buffer (LLM response, up to 1K chars)
;   0x2500-0x25FF: Status line text
;
; Registers:
;   r10: CMP result (reserved)
;   r11: Key input from IKEY
;   r14: Cursor position (offset into input buffer)
;   r9: Input buffer base (0x2000)
;   r8: Response buffer base (0x2100)
;   r2: Max response length (256)
;   r15: Response length (from LLM opcode)
;   r3: Constant 1
;   r4: Constant 9 (Tab ASCII)
;   r7: Constant 10 (Enter/LF)
;   r5: Constant 8 (Backspace)
;   r6: Constant 27 (Escape)
;   r13: Loop temp
;   r1: Screen Y for text rendering
;   r12: Constant 32 (space)
;   r0: Tick counter for blinking cursor
;   r16: Color for prompt text

; Initialize constants
LDI r9, 0x2000          ; input buffer base
LDI r8, 0x2100          ; response buffer base
LDI r2, 256             ; max response length
LDI r3, 1
LDI r4, 9               ; Tab
LDI r7, 10              ; LF
LDI r5, 8              ; Backspace
LDI r6, 27             ; Escape
LDI r12, 32             ; Space
LDI r0, 0              ; tick counter
LDI r16, 0x00FF00       ; green color for prompt

; Write title bar
LDI r13, 0
CALL draw_title

; Write prompt indicator "> " at top
LDI r13, 0x2000
LDI r1, 0
CALL clear_input

; Write status line
LDI r13, 0x2500
LDI r1, 0x00FFFF       ; cyan
LDI r12, 28             ; screen Y position
CALL write_status

; Main loop
main_loop:
    FILL r10             ; clear screen (black)
    ; Redraw on every frame

    ; Draw title
    CALL draw_title

    ; Draw input prompt "> " in green
    LDI r13, 0x00FF00   ; green
    LDI r1, 2           ; x
    LDI r12, 4           ; y (below title)
    LDI r0, 0x2000      ; input buffer
    CALL draw_text_line

    ; Draw response in white below input
    LDI r13, 0xFFFFFF   ; white
    LDI r1, 2           ; x
    LDI r12, 6           ; y (below prompt)
    LDI r0, 0x2100      ; response buffer
    CALL draw_text_line

    ; Draw status bar
    LDI r13, 0x00FFFF   ; cyan
    LDI r1, 2           ; x
    LDI r12, 28          ; y (bottom area)
    LDI r0, 0x2500      ; status buffer
    CALL draw_text_line

    ; Read keyboard
    IKEY r11
    LDI r13, 0
    ADD r13, r11
    JZ r13, main_loop_continue

    ; Check Escape
    CMP r11, r6
    JZ r10, done

    ; Check Tab (send to LLM)
    CMP r11, r4
    JZ r10, send_to_llm

    ; Check Enter (clear input)
    CMP r11, r7
    JZ r10, handle_enter

    ; Check Backspace
    CMP r11, r5
    JZ r10, handle_backspace

    ; Regular character - store in input buffer
    ; Find end of current input (null terminator)
    LDI r13, 0x2000
    CALL find_end
    ; r13 = address of null terminator
    ; Check buffer not full
    LDI r1, 0x20FF
    CMP r13, r1
    BGE r10, main_loop_continue
    ; Store character
    STORE r13, r11

main_loop_continue:
    FRAME
    JMP main_loop

; --- Send prompt to LLM ---
send_to_llm:
    ; Update status to "Thinking..."
    LDI r13, 0x2500
    LDI r1, 84           ; 'T'
    STORE r13, r1
    LDI r1, 104          ; 'h'
    ADD r13, r3
    STORE r13, r1
    LDI r1, 105          ; 'i'
    ADD r13, r3
    STORE r13, r1
    LDI r1, 110          ; 'n'
    ADD r13, r3
    STORE r13, r1
    LDI r1, 107          ; 'k'
    ADD r13, r3
    STORE r13, r1
    LDI r1, 105          ; 'i'
    ADD r13, r3
    STORE r13, r1
    LDI r1, 110          ; 'n'
    ADD r13, r3
    STORE r13, r1
    LDI r1, 103          ; 'g'
    ADD r13, r3
    STORE r13, r1
    LDI r1, 46           ; '.'
    ADD r13, r3
    STORE r13, r1
    LDI r1, 46           ; '.'
    ADD r13, r3
    STORE r13, r1
    LDI r1, 46           ; '.'
    ADD r13, r3
    STORE r13, r1
    LDI r1, 0            ; null terminate
    ADD r13, r3
    STORE r13, r1

    ; Call LLM opcode: LLM prompt_addr, response_addr, max_len
    LLM r9, r8, r2

    ; r10 = response length
    ; Clear input buffer for next prompt
    LDI r13, 0x2000
    CALL clear_input

    ; Update status
    LDI r13, 0x2500
    LDI r1, 68            ; 'D'
    STORE r13, r1
    LDI r1, 111           ; 'o'
    ADD r13, r3
    STORE r13, r1
    LDI r1, 110           ; 'n'
    ADD r13, r3
    STORE r13, r1
    LDI r1, 101           ; 'e'
    ADD r13, r3
    STORE r13, r1
    LDI r1, 46            ; '.'
    ADD r13, r3
    STORE r13, r1
    LDI r1, 0
    ADD r13, r3
    STORE r13, r1

    JMP main_loop_continue

; --- Handle Enter: clear input and response ---
handle_enter:
    LDI r13, 0x2000
    CALL clear_input
    LDI r13, 0x2100
    CALL clear_input
    JMP main_loop_continue

; --- Handle Backspace ---
handle_backspace:
    LDI r13, 0x2000
    CALL find_end
    ; If at buffer start, ignore
    LDI r1, 0x2000
    CMP r13, r1
    JZ r10, main_loop_continue
    ; Go back one and null-terminate
    SUB r13, r3
    LDI r1, 0
    STORE r13, r1
    JMP main_loop_continue

; --- Draw title bar ---
draw_title:
    PUSH r31
    ; Draw title background
    LDI r13, 0x222244     ; dark purple
    LDI r1, 0
    LDI r12, 0
    LDI r0, 256
    LDI r16, 12
    RECTF r1, r12, r0, r16, r13

    ; Draw "Smart Terminal - Press Tab for AI, Esc to quit"
    ; Use TEXT opcode to render title
    ; Title is stored inline -- write it to RAM first
    LDI r13, 0x2600
    LDI r1, 83           ; 'S'
    STORE r13, r1
    LDI r1, 109          ; 'm'
    ADD r13, r3
    STORE r13, r1
    LDI r1, 97           ; 'a'
    ADD r13, r3
    STORE r13, r1
    LDI r1, 114          ; 'r'
    ADD r13, r3
    STORE r13, r1
    LDI r1, 116          ; 't'
    ADD r13, r3
    STORE r13, r1
    LDI r1, 32           ; ' '
    ADD r13, r3
    STORE r13, r1
    LDI r1, 84           ; 'T'
    ADD r13, r3
    STORE r13, r1
    LDI r1, 101          ; 'e'
    ADD r13, r3
    STORE r13, r1
    LDI r1, 114          ; 'r'
    ADD r13, r3
    STORE r13, r1
    LDI r1, 109          ; 'm'
    ADD r13, r3
    STORE r13, r1
    LDI r1, 0            ; null terminate
    ADD r13, r3
    STORE r13, r1

    ; Render with TEXT opcode
    LDI r13, 0x2600       ; source addr
    LDI r1, 4            ; x
    LDI r12, 2            ; y
    LDI r0, 0xFFFF00     ; yellow
    TEXT r1, r12, r13

    POP r31
    RET

; --- Write status line ---
write_status:
    ; "Tab=AI  Esc=Quit  Enter=Clear"
    PUSH r31
    LDI r13, 0x2500
    LDI r1, 84           ; 'T'
    STORE r13, r1
    LDI r1, 97           ; 'a'
    ADD r13, r3
    STORE r13, r1
    LDI r1, 98           ; 'b'
    ADD r13, r3
    STORE r13, r1
    LDI r1, 61           ; '='
    ADD r13, r3
    STORE r13, r1
    LDI r1, 65           ; 'A'
    ADD r13, r3
    STORE r13, r1
    LDI r1, 73           ; 'I'
    ADD r13, r3
    STORE r13, r1
    LDI r1, 32           ; ' '
    ADD r13, r3
    STORE r13, r1
    LDI r1, 32           ; ' '
    ADD r13, r3
    STORE r13, r1
    LDI r1, 69           ; 'E'
    ADD r13, r3
    STORE r13, r1
    LDI r1, 115          ; 's'
    ADD r13, r3
    STORE r13, r1
    LDI r1, 99           ; 'c'
    ADD r13, r3
    STORE r13, r1
    LDI r1, 61           ; '='
    ADD r13, r3
    STORE r13, r1
    LDI r1, 81           ; 'Q'
    ADD r13, r3
    STORE r13, r1
    LDI r1, 117          ; 'u'
    ADD r13, r3
    STORE r13, r1
    LDI r1, 105          ; 'i'
    ADD r13, r3
    STORE r13, r1
    LDI r1, 116          ; 't'
    ADD r13, r3
    STORE r13, r1
    LDI r1, 0            ; null terminate
    ADD r13, r3
    STORE r13, r1
    POP r31
    RET

; --- Draw text line from RAM buffer ---
; r13 = color, r1 = screen x, r12 = screen y, r0 = RAM addr
draw_text_line:
    PUSH r31
    PUSH r0
    PUSH r13
draw_text_loop:
    LOAD r16, r0
    LDI r13, 0
    CMP r16, r13
    JZ r10, draw_text_done
    PSET r1, r12, r13
    ADD r1, r3
    ADD r0, r3
    JMP draw_text_loop
draw_text_done:
    POP r13
    POP r0
    POP r31
    RET

; --- Find null terminator in buffer ---
; r13 = start address. Returns r13 = address of null.
find_end:
    PUSH r31
    PUSH r3
find_end_loop:
    LOAD r16, r13
    LDI r1, 0
    CMP r16, r1
    JZ r10, find_end_done
    ADD r13, r3
    JMP find_end_loop
find_end_done:
    POP r3
    POP r31
    RET

; --- Clear input buffer (fill with 0) ---
; r13 = buffer start address
clear_input:
    PUSH r31
    PUSH r3
    PUSH r13
    LDI r1, 0
    LDI r16, 256           ; max clear length
clear_loop:
    STORE r13, r1
    ADD r13, r3
    LDI r12, 0
    ADD r12, r13
    LDI r0, 0x2100
    ; Only clear up to response buffer size
    CMP r12, r0
    BGE r10, clear_done
    JMP clear_loop
clear_done:
    POP r13
    POP r3
    POP r31
    RET

done:
    HALT
