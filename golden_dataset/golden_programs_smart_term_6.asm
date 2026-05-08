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
;   r11: CMP result (reserved)
;   r10: Key input from IKEY
;   r1: Cursor position (offset into input buffer)
;   r8: Input buffer base (0x2000)
;   r4: Response buffer base (0x2100)
;   r13: Max response length (256)
;   r12: Response length (from LLM opcode)
;   r0: Constant 1
;   r9: Constant 9 (Tab ASCII)
;   r6: Constant 10 (Enter/LF)
;   r3: Constant 8 (Backspace)
;   r7: Constant 27 (Escape)
;   r14: Loop temp
;   r15: Screen Y for text rendering
;   r5: Constant 32 (space)
;   r2: Tick counter for blinking cursor
;   r16: Color for prompt text

; Initialize constants
LDI r8, 0x2000          ; input buffer base
LDI r4, 0x2100          ; response buffer base
LDI r13, 256             ; max response length
LDI r0, 1
LDI r9, 9               ; Tab
LDI r6, 10              ; LF
LDI r3, 8              ; Backspace
LDI r7, 27             ; Escape
LDI r5, 32             ; Space
LDI r2, 0              ; tick counter
LDI r16, 0x00FF00       ; green color for prompt

; Write title bar
LDI r14, 0
CALL draw_title

; Write prompt indicator "> " at top
LDI r14, 0x2000
LDI r15, 0
CALL clear_input

; Write status line
LDI r14, 0x2500
LDI r15, 0x00FFFF       ; cyan
LDI r5, 28             ; screen Y position
CALL write_status

; Main loop
main_loop:
    FILL r11             ; clear screen (black)
    ; Redraw on every frame

    ; Draw title
    CALL draw_title

    ; Draw input prompt "> " in green
    LDI r14, 0x00FF00   ; green
    LDI r15, 2           ; x
    LDI r5, 4           ; y (below title)
    LDI r2, 0x2000      ; input buffer
    CALL draw_text_line

    ; Draw response in white below input
    LDI r14, 0xFFFFFF   ; white
    LDI r15, 2           ; x
    LDI r5, 6           ; y (below prompt)
    LDI r2, 0x2100      ; response buffer
    CALL draw_text_line

    ; Draw status bar
    LDI r14, 0x00FFFF   ; cyan
    LDI r15, 2           ; x
    LDI r5, 28          ; y (bottom area)
    LDI r2, 0x2500      ; status buffer
    CALL draw_text_line

    ; Read keyboard
    IKEY r10
    LDI r14, 0
    ADD r14, r10
    JZ r14, main_loop_continue

    ; Check Escape
    CMP r10, r7
    JZ r11, done

    ; Check Tab (send to LLM)
    CMP r10, r9
    JZ r11, send_to_llm

    ; Check Enter (clear input)
    CMP r10, r6
    JZ r11, handle_enter

    ; Check Backspace
    CMP r10, r3
    JZ r11, handle_backspace

    ; Regular character - store in input buffer
    ; Find end of current input (null terminator)
    LDI r14, 0x2000
    CALL find_end
    ; r14 = address of null terminator
    ; Check buffer not full
    LDI r15, 0x20FF
    CMP r14, r15
    BGE r11, main_loop_continue
    ; Store character
    STORE r14, r10

main_loop_continue:
    FRAME
    JMP main_loop

; --- Send prompt to LLM ---
send_to_llm:
    ; Update status to "Thinking..."
    LDI r14, 0x2500
    LDI r15, 84           ; 'T'
    STORE r14, r15
    LDI r15, 104          ; 'h'
    ADD r14, r0
    STORE r14, r15
    LDI r15, 105          ; 'i'
    ADD r14, r0
    STORE r14, r15
    LDI r15, 110          ; 'n'
    ADD r14, r0
    STORE r14, r15
    LDI r15, 107          ; 'k'
    ADD r14, r0
    STORE r14, r15
    LDI r15, 105          ; 'i'
    ADD r14, r0
    STORE r14, r15
    LDI r15, 110          ; 'n'
    ADD r14, r0
    STORE r14, r15
    LDI r15, 103          ; 'g'
    ADD r14, r0
    STORE r14, r15
    LDI r15, 46           ; '.'
    ADD r14, r0
    STORE r14, r15
    LDI r15, 46           ; '.'
    ADD r14, r0
    STORE r14, r15
    LDI r15, 46           ; '.'
    ADD r14, r0
    STORE r14, r15
    LDI r15, 0            ; null terminate
    ADD r14, r0
    STORE r14, r15

    ; Call LLM opcode: LLM prompt_addr, response_addr, max_len
    LLM r8, r4, r13

    ; r11 = response length
    ; Clear input buffer for next prompt
    LDI r14, 0x2000
    CALL clear_input

    ; Update status
    LDI r14, 0x2500
    LDI r15, 68            ; 'D'
    STORE r14, r15
    LDI r15, 111           ; 'o'
    ADD r14, r0
    STORE r14, r15
    LDI r15, 110           ; 'n'
    ADD r14, r0
    STORE r14, r15
    LDI r15, 101           ; 'e'
    ADD r14, r0
    STORE r14, r15
    LDI r15, 46            ; '.'
    ADD r14, r0
    STORE r14, r15
    LDI r15, 0
    ADD r14, r0
    STORE r14, r15

    JMP main_loop_continue

; --- Handle Enter: clear input and response ---
handle_enter:
    LDI r14, 0x2000
    CALL clear_input
    LDI r14, 0x2100
    CALL clear_input
    JMP main_loop_continue

; --- Handle Backspace ---
handle_backspace:
    LDI r14, 0x2000
    CALL find_end
    ; If at buffer start, ignore
    LDI r15, 0x2000
    CMP r14, r15
    JZ r11, main_loop_continue
    ; Go back one and null-terminate
    SUB r14, r0
    LDI r15, 0
    STORE r14, r15
    JMP main_loop_continue

; --- Draw title bar ---
draw_title:
    PUSH r31
    ; Draw title background
    LDI r14, 0x222244     ; dark purple
    LDI r15, 0
    LDI r5, 0
    LDI r2, 256
    LDI r16, 12
    RECTF r15, r5, r2, r16, r14

    ; Draw "Smart Terminal - Press Tab for AI, Esc to quit"
    ; Use TEXT opcode to render title
    ; Title is stored inline -- write it to RAM first
    LDI r14, 0x2600
    LDI r15, 83           ; 'S'
    STORE r14, r15
    LDI r15, 109          ; 'm'
    ADD r14, r0
    STORE r14, r15
    LDI r15, 97           ; 'a'
    ADD r14, r0
    STORE r14, r15
    LDI r15, 114          ; 'r'
    ADD r14, r0
    STORE r14, r15
    LDI r15, 116          ; 't'
    ADD r14, r0
    STORE r14, r15
    LDI r15, 32           ; ' '
    ADD r14, r0
    STORE r14, r15
    LDI r15, 84           ; 'T'
    ADD r14, r0
    STORE r14, r15
    LDI r15, 101          ; 'e'
    ADD r14, r0
    STORE r14, r15
    LDI r15, 114          ; 'r'
    ADD r14, r0
    STORE r14, r15
    LDI r15, 109          ; 'm'
    ADD r14, r0
    STORE r14, r15
    LDI r15, 0            ; null terminate
    ADD r14, r0
    STORE r14, r15

    ; Render with TEXT opcode
    LDI r14, 0x2600       ; source addr
    LDI r15, 4            ; x
    LDI r5, 2            ; y
    LDI r2, 0xFFFF00     ; yellow
    TEXT r15, r5, r14

    POP r31
    RET

; --- Write status line ---
write_status:
    ; "Tab=AI  Esc=Quit  Enter=Clear"
    PUSH r31
    LDI r14, 0x2500
    LDI r15, 84           ; 'T'
    STORE r14, r15
    LDI r15, 97           ; 'a'
    ADD r14, r0
    STORE r14, r15
    LDI r15, 98           ; 'b'
    ADD r14, r0
    STORE r14, r15
    LDI r15, 61           ; '='
    ADD r14, r0
    STORE r14, r15
    LDI r15, 65           ; 'A'
    ADD r14, r0
    STORE r14, r15
    LDI r15, 73           ; 'I'
    ADD r14, r0
    STORE r14, r15
    LDI r15, 32           ; ' '
    ADD r14, r0
    STORE r14, r15
    LDI r15, 32           ; ' '
    ADD r14, r0
    STORE r14, r15
    LDI r15, 69           ; 'E'
    ADD r14, r0
    STORE r14, r15
    LDI r15, 115          ; 's'
    ADD r14, r0
    STORE r14, r15
    LDI r15, 99           ; 'c'
    ADD r14, r0
    STORE r14, r15
    LDI r15, 61           ; '='
    ADD r14, r0
    STORE r14, r15
    LDI r15, 81           ; 'Q'
    ADD r14, r0
    STORE r14, r15
    LDI r15, 117          ; 'u'
    ADD r14, r0
    STORE r14, r15
    LDI r15, 105          ; 'i'
    ADD r14, r0
    STORE r14, r15
    LDI r15, 116          ; 't'
    ADD r14, r0
    STORE r14, r15
    LDI r15, 0            ; null terminate
    ADD r14, r0
    STORE r14, r15
    POP r31
    RET

; --- Draw text line from RAM buffer ---
; r14 = color, r15 = screen x, r5 = screen y, r2 = RAM addr
draw_text_line:
    PUSH r31
    PUSH r2
    PUSH r14
draw_text_loop:
    LOAD r16, r2
    LDI r14, 0
    CMP r16, r14
    JZ r11, draw_text_done
    PSET r15, r5, r14
    ADD r15, r0
    ADD r2, r0
    JMP draw_text_loop
draw_text_done:
    POP r14
    POP r2
    POP r31
    RET

; --- Find null terminator in buffer ---
; r14 = start address. Returns r14 = address of null.
find_end:
    PUSH r31
    PUSH r0
find_end_loop:
    LOAD r16, r14
    LDI r15, 0
    CMP r16, r15
    JZ r11, find_end_done
    ADD r14, r0
    JMP find_end_loop
find_end_done:
    POP r0
    POP r31
    RET

; --- Clear input buffer (fill with 0) ---
; r14 = buffer start address
clear_input:
    PUSH r31
    PUSH r0
    PUSH r14
    LDI r15, 0
    LDI r16, 256           ; max clear length
clear_loop:
    STORE r14, r15
    ADD r14, r0
    LDI r5, 0
    ADD r5, r14
    LDI r2, 0x2100
    ; Only clear up to response buffer size
    CMP r5, r2
    BGE r11, clear_done
    JMP clear_loop
clear_done:
    POP r14
    POP r0
    POP r31
    RET

done:
    HALT
