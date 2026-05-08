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
;   r12: CMP result (reserved)
;   r1: Key input from IKEY
;   r13: Cursor position (offset into input buffer)
;   r7: Input buffer base (0x2000)
;   r15: Response buffer base (0x2100)
;   r8: Max response length (256)
;   r2: Response length (from LLM opcode)
;   r5: Constant 1
;   r14: Constant 9 (Tab ASCII)
;   r0: Constant 10 (Enter/LF)
;   r4: Constant 8 (Backspace)
;   r6: Constant 27 (Escape)
;   r11: Loop temp
;   r9: Screen Y for text rendering
;   r10: Constant 32 (space)
;   r3: Tick counter for blinking cursor
;   r16: Color for prompt text

; Initialize constants
LDI r7, 0x2000          ; input buffer base
LDI r15, 0x2100          ; response buffer base
LDI r8, 256             ; max response length
LDI r5, 1
LDI r14, 9               ; Tab
LDI r0, 10              ; LF
LDI r4, 8              ; Backspace
LDI r6, 27             ; Escape
LDI r10, 32             ; Space
LDI r3, 0              ; tick counter
LDI r16, 0x00FF00       ; green color for prompt

; Write title bar
LDI r11, 0
CALL draw_title

; Write prompt indicator "> " at top
LDI r11, 0x2000
LDI r9, 0
CALL clear_input

; Write status line
LDI r11, 0x2500
LDI r9, 0x00FFFF       ; cyan
LDI r10, 28             ; screen Y position
CALL write_status

; Main loop
main_loop:
    FILL r12             ; clear screen (black)
    ; Redraw on every frame

    ; Draw title
    CALL draw_title

    ; Draw input prompt "> " in green
    LDI r11, 0x00FF00   ; green
    LDI r9, 2           ; x
    LDI r10, 4           ; y (below title)
    LDI r3, 0x2000      ; input buffer
    CALL draw_text_line

    ; Draw response in white below input
    LDI r11, 0xFFFFFF   ; white
    LDI r9, 2           ; x
    LDI r10, 6           ; y (below prompt)
    LDI r3, 0x2100      ; response buffer
    CALL draw_text_line

    ; Draw status bar
    LDI r11, 0x00FFFF   ; cyan
    LDI r9, 2           ; x
    LDI r10, 28          ; y (bottom area)
    LDI r3, 0x2500      ; status buffer
    CALL draw_text_line

    ; Read keyboard
    IKEY r1
    LDI r11, 0
    ADD r11, r1
    JZ r11, main_loop_continue

    ; Check Escape
    CMP r1, r6
    JZ r12, done

    ; Check Tab (send to LLM)
    CMP r1, r14
    JZ r12, send_to_llm

    ; Check Enter (clear input)
    CMP r1, r0
    JZ r12, handle_enter

    ; Check Backspace
    CMP r1, r4
    JZ r12, handle_backspace

    ; Regular character - store in input buffer
    ; Find end of current input (null terminator)
    LDI r11, 0x2000
    CALL find_end
    ; r11 = address of null terminator
    ; Check buffer not full
    LDI r9, 0x20FF
    CMP r11, r9
    BGE r12, main_loop_continue
    ; Store character
    STORE r11, r1

main_loop_continue:
    FRAME
    JMP main_loop

; --- Send prompt to LLM ---
send_to_llm:
    ; Update status to "Thinking..."
    LDI r11, 0x2500
    LDI r9, 84           ; 'T'
    STORE r11, r9
    LDI r9, 104          ; 'h'
    ADD r11, r5
    STORE r11, r9
    LDI r9, 105          ; 'i'
    ADD r11, r5
    STORE r11, r9
    LDI r9, 110          ; 'n'
    ADD r11, r5
    STORE r11, r9
    LDI r9, 107          ; 'k'
    ADD r11, r5
    STORE r11, r9
    LDI r9, 105          ; 'i'
    ADD r11, r5
    STORE r11, r9
    LDI r9, 110          ; 'n'
    ADD r11, r5
    STORE r11, r9
    LDI r9, 103          ; 'g'
    ADD r11, r5
    STORE r11, r9
    LDI r9, 46           ; '.'
    ADD r11, r5
    STORE r11, r9
    LDI r9, 46           ; '.'
    ADD r11, r5
    STORE r11, r9
    LDI r9, 46           ; '.'
    ADD r11, r5
    STORE r11, r9
    LDI r9, 0            ; null terminate
    ADD r11, r5
    STORE r11, r9

    ; Call LLM opcode: LLM prompt_addr, response_addr, max_len
    LLM r7, r15, r8

    ; r12 = response length
    ; Clear input buffer for next prompt
    LDI r11, 0x2000
    CALL clear_input

    ; Update status
    LDI r11, 0x2500
    LDI r9, 68            ; 'D'
    STORE r11, r9
    LDI r9, 111           ; 'o'
    ADD r11, r5
    STORE r11, r9
    LDI r9, 110           ; 'n'
    ADD r11, r5
    STORE r11, r9
    LDI r9, 101           ; 'e'
    ADD r11, r5
    STORE r11, r9
    LDI r9, 46            ; '.'
    ADD r11, r5
    STORE r11, r9
    LDI r9, 0
    ADD r11, r5
    STORE r11, r9

    JMP main_loop_continue

; --- Handle Enter: clear input and response ---
handle_enter:
    LDI r11, 0x2000
    CALL clear_input
    LDI r11, 0x2100
    CALL clear_input
    JMP main_loop_continue

; --- Handle Backspace ---
handle_backspace:
    LDI r11, 0x2000
    CALL find_end
    ; If at buffer start, ignore
    LDI r9, 0x2000
    CMP r11, r9
    JZ r12, main_loop_continue
    ; Go back one and null-terminate
    SUB r11, r5
    LDI r9, 0
    STORE r11, r9
    JMP main_loop_continue

; --- Draw title bar ---
draw_title:
    PUSH r31
    ; Draw title background
    LDI r11, 0x222244     ; dark purple
    LDI r9, 0
    LDI r10, 0
    LDI r3, 256
    LDI r16, 12
    RECTF r9, r10, r3, r16, r11

    ; Draw "Smart Terminal - Press Tab for AI, Esc to quit"
    ; Use TEXT opcode to render title
    ; Title is stored inline -- write it to RAM first
    LDI r11, 0x2600
    LDI r9, 83           ; 'S'
    STORE r11, r9
    LDI r9, 109          ; 'm'
    ADD r11, r5
    STORE r11, r9
    LDI r9, 97           ; 'a'
    ADD r11, r5
    STORE r11, r9
    LDI r9, 114          ; 'r'
    ADD r11, r5
    STORE r11, r9
    LDI r9, 116          ; 't'
    ADD r11, r5
    STORE r11, r9
    LDI r9, 32           ; ' '
    ADD r11, r5
    STORE r11, r9
    LDI r9, 84           ; 'T'
    ADD r11, r5
    STORE r11, r9
    LDI r9, 101          ; 'e'
    ADD r11, r5
    STORE r11, r9
    LDI r9, 114          ; 'r'
    ADD r11, r5
    STORE r11, r9
    LDI r9, 109          ; 'm'
    ADD r11, r5
    STORE r11, r9
    LDI r9, 0            ; null terminate
    ADD r11, r5
    STORE r11, r9

    ; Render with TEXT opcode
    LDI r11, 0x2600       ; source addr
    LDI r9, 4            ; x
    LDI r10, 2            ; y
    LDI r3, 0xFFFF00     ; yellow
    TEXT r9, r10, r11

    POP r31
    RET

; --- Write status line ---
write_status:
    ; "Tab=AI  Esc=Quit  Enter=Clear"
    PUSH r31
    LDI r11, 0x2500
    LDI r9, 84           ; 'T'
    STORE r11, r9
    LDI r9, 97           ; 'a'
    ADD r11, r5
    STORE r11, r9
    LDI r9, 98           ; 'b'
    ADD r11, r5
    STORE r11, r9
    LDI r9, 61           ; '='
    ADD r11, r5
    STORE r11, r9
    LDI r9, 65           ; 'A'
    ADD r11, r5
    STORE r11, r9
    LDI r9, 73           ; 'I'
    ADD r11, r5
    STORE r11, r9
    LDI r9, 32           ; ' '
    ADD r11, r5
    STORE r11, r9
    LDI r9, 32           ; ' '
    ADD r11, r5
    STORE r11, r9
    LDI r9, 69           ; 'E'
    ADD r11, r5
    STORE r11, r9
    LDI r9, 115          ; 's'
    ADD r11, r5
    STORE r11, r9
    LDI r9, 99           ; 'c'
    ADD r11, r5
    STORE r11, r9
    LDI r9, 61           ; '='
    ADD r11, r5
    STORE r11, r9
    LDI r9, 81           ; 'Q'
    ADD r11, r5
    STORE r11, r9
    LDI r9, 117          ; 'u'
    ADD r11, r5
    STORE r11, r9
    LDI r9, 105          ; 'i'
    ADD r11, r5
    STORE r11, r9
    LDI r9, 116          ; 't'
    ADD r11, r5
    STORE r11, r9
    LDI r9, 0            ; null terminate
    ADD r11, r5
    STORE r11, r9
    POP r31
    RET

; --- Draw text line from RAM buffer ---
; r11 = color, r9 = screen x, r10 = screen y, r3 = RAM addr
draw_text_line:
    PUSH r31
    PUSH r3
    PUSH r11
draw_text_loop:
    LOAD r16, r3
    LDI r11, 0
    CMP r16, r11
    JZ r12, draw_text_done
    PSET r9, r10, r11
    ADD r9, r5
    ADD r3, r5
    JMP draw_text_loop
draw_text_done:
    POP r11
    POP r3
    POP r31
    RET

; --- Find null terminator in buffer ---
; r11 = start address. Returns r11 = address of null.
find_end:
    PUSH r31
    PUSH r5
find_end_loop:
    LOAD r16, r11
    LDI r9, 0
    CMP r16, r9
    JZ r12, find_end_done
    ADD r11, r5
    JMP find_end_loop
find_end_done:
    POP r5
    POP r31
    RET

; --- Clear input buffer (fill with 0) ---
; r11 = buffer start address
clear_input:
    PUSH r31
    PUSH r5
    PUSH r11
    LDI r9, 0
    LDI r16, 256           ; max clear length
clear_loop:
    STORE r11, r9
    ADD r11, r5
    LDI r10, 0
    ADD r10, r11
    LDI r3, 0x2100
    ; Only clear up to response buffer size
    CMP r10, r3
    BGE r12, clear_done
    JMP clear_loop
clear_done:
    POP r11
    POP r5
    POP r31
    RET

done:
    HALT
