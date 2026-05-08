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
;   r14: Key input from IKEY
;   r3: Cursor position (offset into input buffer)
;   r8: Input buffer base (0x2000)
;   r12: Response buffer base (0x2100)
;   r13: Max response length (256)
;   r4: Response length (from LLM opcode)
;   r15: Constant 1
;   r6: Constant 9 (Tab ASCII)
;   r9: Constant 10 (Enter/LF)
;   r7: Constant 8 (Backspace)
;   r0: Constant 27 (Escape)
;   r2: Loop temp
;   r10: Screen Y for text rendering
;   r1: Constant 32 (space)
;   r5: Tick counter for blinking cursor
;   r16: Color for prompt text

; Initialize constants
LDI r8, 0x2000          ; input buffer base
LDI r12, 0x2100          ; response buffer base
LDI r13, 256             ; max response length
LDI r15, 1
LDI r6, 9               ; Tab
LDI r9, 10              ; LF
LDI r7, 8              ; Backspace
LDI r0, 27             ; Escape
LDI r1, 32             ; Space
LDI r5, 0              ; tick counter
LDI r16, 0x00FF00       ; green color for prompt

; Write title bar
LDI r2, 0
CALL draw_title

; Write prompt indicator "> " at top
LDI r2, 0x2000
LDI r10, 0
CALL clear_input

; Write status line
LDI r2, 0x2500
LDI r10, 0x00FFFF       ; cyan
LDI r1, 28             ; screen Y position
CALL write_status

; Main loop
main_loop:
    FILL r11             ; clear screen (black)
    ; Redraw on every frame

    ; Draw title
    CALL draw_title

    ; Draw input prompt "> " in green
    LDI r2, 0x00FF00   ; green
    LDI r10, 2           ; x
    LDI r1, 4           ; y (below title)
    LDI r5, 0x2000      ; input buffer
    CALL draw_text_line

    ; Draw response in white below input
    LDI r2, 0xFFFFFF   ; white
    LDI r10, 2           ; x
    LDI r1, 6           ; y (below prompt)
    LDI r5, 0x2100      ; response buffer
    CALL draw_text_line

    ; Draw status bar
    LDI r2, 0x00FFFF   ; cyan
    LDI r10, 2           ; x
    LDI r1, 28          ; y (bottom area)
    LDI r5, 0x2500      ; status buffer
    CALL draw_text_line

    ; Read keyboard
    IKEY r14
    LDI r2, 0
    ADD r2, r14
    JZ r2, main_loop_continue

    ; Check Escape
    CMP r14, r0
    JZ r11, done

    ; Check Tab (send to LLM)
    CMP r14, r6
    JZ r11, send_to_llm

    ; Check Enter (clear input)
    CMP r14, r9
    JZ r11, handle_enter

    ; Check Backspace
    CMP r14, r7
    JZ r11, handle_backspace

    ; Regular character - store in input buffer
    ; Find end of current input (null terminator)
    LDI r2, 0x2000
    CALL find_end
    ; r2 = address of null terminator
    ; Check buffer not full
    LDI r10, 0x20FF
    CMP r2, r10
    BGE r11, main_loop_continue
    ; Store character
    STORE r2, r14

main_loop_continue:
    FRAME
    JMP main_loop

; --- Send prompt to LLM ---
send_to_llm:
    ; Update status to "Thinking..."
    LDI r2, 0x2500
    LDI r10, 84           ; 'T'
    STORE r2, r10
    LDI r10, 104          ; 'h'
    ADD r2, r15
    STORE r2, r10
    LDI r10, 105          ; 'i'
    ADD r2, r15
    STORE r2, r10
    LDI r10, 110          ; 'n'
    ADD r2, r15
    STORE r2, r10
    LDI r10, 107          ; 'k'
    ADD r2, r15
    STORE r2, r10
    LDI r10, 105          ; 'i'
    ADD r2, r15
    STORE r2, r10
    LDI r10, 110          ; 'n'
    ADD r2, r15
    STORE r2, r10
    LDI r10, 103          ; 'g'
    ADD r2, r15
    STORE r2, r10
    LDI r10, 46           ; '.'
    ADD r2, r15
    STORE r2, r10
    LDI r10, 46           ; '.'
    ADD r2, r15
    STORE r2, r10
    LDI r10, 46           ; '.'
    ADD r2, r15
    STORE r2, r10
    LDI r10, 0            ; null terminate
    ADD r2, r15
    STORE r2, r10

    ; Call LLM opcode: LLM prompt_addr, response_addr, max_len
    LLM r8, r12, r13

    ; r11 = response length
    ; Clear input buffer for next prompt
    LDI r2, 0x2000
    CALL clear_input

    ; Update status
    LDI r2, 0x2500
    LDI r10, 68            ; 'D'
    STORE r2, r10
    LDI r10, 111           ; 'o'
    ADD r2, r15
    STORE r2, r10
    LDI r10, 110           ; 'n'
    ADD r2, r15
    STORE r2, r10
    LDI r10, 101           ; 'e'
    ADD r2, r15
    STORE r2, r10
    LDI r10, 46            ; '.'
    ADD r2, r15
    STORE r2, r10
    LDI r10, 0
    ADD r2, r15
    STORE r2, r10

    JMP main_loop_continue

; --- Handle Enter: clear input and response ---
handle_enter:
    LDI r2, 0x2000
    CALL clear_input
    LDI r2, 0x2100
    CALL clear_input
    JMP main_loop_continue

; --- Handle Backspace ---
handle_backspace:
    LDI r2, 0x2000
    CALL find_end
    ; If at buffer start, ignore
    LDI r10, 0x2000
    CMP r2, r10
    JZ r11, main_loop_continue
    ; Go back one and null-terminate
    SUB r2, r15
    LDI r10, 0
    STORE r2, r10
    JMP main_loop_continue

; --- Draw title bar ---
draw_title:
    PUSH r31
    ; Draw title background
    LDI r2, 0x222244     ; dark purple
    LDI r10, 0
    LDI r1, 0
    LDI r5, 256
    LDI r16, 12
    RECTF r10, r1, r5, r16, r2

    ; Draw "Smart Terminal - Press Tab for AI, Esc to quit"
    ; Use TEXT opcode to render title
    ; Title is stored inline -- write it to RAM first
    LDI r2, 0x2600
    LDI r10, 83           ; 'S'
    STORE r2, r10
    LDI r10, 109          ; 'm'
    ADD r2, r15
    STORE r2, r10
    LDI r10, 97           ; 'a'
    ADD r2, r15
    STORE r2, r10
    LDI r10, 114          ; 'r'
    ADD r2, r15
    STORE r2, r10
    LDI r10, 116          ; 't'
    ADD r2, r15
    STORE r2, r10
    LDI r10, 32           ; ' '
    ADD r2, r15
    STORE r2, r10
    LDI r10, 84           ; 'T'
    ADD r2, r15
    STORE r2, r10
    LDI r10, 101          ; 'e'
    ADD r2, r15
    STORE r2, r10
    LDI r10, 114          ; 'r'
    ADD r2, r15
    STORE r2, r10
    LDI r10, 109          ; 'm'
    ADD r2, r15
    STORE r2, r10
    LDI r10, 0            ; null terminate
    ADD r2, r15
    STORE r2, r10

    ; Render with TEXT opcode
    LDI r2, 0x2600       ; source addr
    LDI r10, 4            ; x
    LDI r1, 2            ; y
    LDI r5, 0xFFFF00     ; yellow
    TEXT r10, r1, r2

    POP r31
    RET

; --- Write status line ---
write_status:
    ; "Tab=AI  Esc=Quit  Enter=Clear"
    PUSH r31
    LDI r2, 0x2500
    LDI r10, 84           ; 'T'
    STORE r2, r10
    LDI r10, 97           ; 'a'
    ADD r2, r15
    STORE r2, r10
    LDI r10, 98           ; 'b'
    ADD r2, r15
    STORE r2, r10
    LDI r10, 61           ; '='
    ADD r2, r15
    STORE r2, r10
    LDI r10, 65           ; 'A'
    ADD r2, r15
    STORE r2, r10
    LDI r10, 73           ; 'I'
    ADD r2, r15
    STORE r2, r10
    LDI r10, 32           ; ' '
    ADD r2, r15
    STORE r2, r10
    LDI r10, 32           ; ' '
    ADD r2, r15
    STORE r2, r10
    LDI r10, 69           ; 'E'
    ADD r2, r15
    STORE r2, r10
    LDI r10, 115          ; 's'
    ADD r2, r15
    STORE r2, r10
    LDI r10, 99           ; 'c'
    ADD r2, r15
    STORE r2, r10
    LDI r10, 61           ; '='
    ADD r2, r15
    STORE r2, r10
    LDI r10, 81           ; 'Q'
    ADD r2, r15
    STORE r2, r10
    LDI r10, 117          ; 'u'
    ADD r2, r15
    STORE r2, r10
    LDI r10, 105          ; 'i'
    ADD r2, r15
    STORE r2, r10
    LDI r10, 116          ; 't'
    ADD r2, r15
    STORE r2, r10
    LDI r10, 0            ; null terminate
    ADD r2, r15
    STORE r2, r10
    POP r31
    RET

; --- Draw text line from RAM buffer ---
; r2 = color, r10 = screen x, r1 = screen y, r5 = RAM addr
draw_text_line:
    PUSH r31
    PUSH r5
    PUSH r2
draw_text_loop:
    LOAD r16, r5
    LDI r2, 0
    CMP r16, r2
    JZ r11, draw_text_done
    PSET r10, r1, r2
    ADD r10, r15
    ADD r5, r15
    JMP draw_text_loop
draw_text_done:
    POP r2
    POP r5
    POP r31
    RET

; --- Find null terminator in buffer ---
; r2 = start address. Returns r2 = address of null.
find_end:
    PUSH r31
    PUSH r15
find_end_loop:
    LOAD r16, r2
    LDI r10, 0
    CMP r16, r10
    JZ r11, find_end_done
    ADD r2, r15
    JMP find_end_loop
find_end_done:
    POP r15
    POP r31
    RET

; --- Clear input buffer (fill with 0) ---
; r2 = buffer start address
clear_input:
    PUSH r31
    PUSH r15
    PUSH r2
    LDI r10, 0
    LDI r16, 256           ; max clear length
clear_loop:
    STORE r2, r10
    ADD r2, r15
    LDI r1, 0
    ADD r1, r2
    LDI r5, 0x2100
    ; Only clear up to response buffer size
    CMP r1, r5
    BGE r11, clear_done
    JMP clear_loop
clear_done:
    POP r2
    POP r15
    POP r31
    RET

done:
    HALT
