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
;   r6: Key input from IKEY
;   r13: Cursor position (offset into input buffer)
;   r0: Input buffer base (0x2000)
;   r15: Response buffer base (0x2100)
;   r11: Max response length (256)
;   r12: Response length (from LLM opcode)
;   r2: Constant 1
;   r5: Constant 9 (Tab ASCII)
;   r14: Constant 10 (Enter/LF)
;   r8: Constant 8 (Backspace)
;   r9: Constant 27 (Escape)
;   r7: Loop temp
;   r3: Screen Y for text rendering
;   r4: Constant 32 (space)
;   r1: Tick counter for blinking cursor
;   r16: Color for prompt text

; Initialize constants
LDI r0, 0x2000          ; input buffer base
LDI r15, 0x2100          ; response buffer base
LDI r11, 256             ; max response length
LDI r2, 1
LDI r5, 9               ; Tab
LDI r14, 10              ; LF
LDI r8, 8              ; Backspace
LDI r9, 27             ; Escape
LDI r4, 32             ; Space
LDI r1, 0              ; tick counter
LDI r16, 0x00FF00       ; green color for prompt

; Write title bar
LDI r7, 0
CALL draw_title

; Write prompt indicator "> " at top
LDI r7, 0x2000
LDI r3, 0
CALL clear_input

; Write status line
LDI r7, 0x2500
LDI r3, 0x00FFFF       ; cyan
LDI r4, 28             ; screen Y position
CALL write_status

; Main loop
main_loop:
    FILL r10             ; clear screen (black)
    ; Redraw on every frame

    ; Draw title
    CALL draw_title

    ; Draw input prompt "> " in green
    LDI r7, 0x00FF00   ; green
    LDI r3, 2           ; x
    LDI r4, 4           ; y (below title)
    LDI r1, 0x2000      ; input buffer
    CALL draw_text_line

    ; Draw response in white below input
    LDI r7, 0xFFFFFF   ; white
    LDI r3, 2           ; x
    LDI r4, 6           ; y (below prompt)
    LDI r1, 0x2100      ; response buffer
    CALL draw_text_line

    ; Draw status bar
    LDI r7, 0x00FFFF   ; cyan
    LDI r3, 2           ; x
    LDI r4, 28          ; y (bottom area)
    LDI r1, 0x2500      ; status buffer
    CALL draw_text_line

    ; Read keyboard
    IKEY r6
    LDI r7, 0
    ADD r7, r6
    JZ r7, main_loop_continue

    ; Check Escape
    CMP r6, r9
    JZ r10, done

    ; Check Tab (send to LLM)
    CMP r6, r5
    JZ r10, send_to_llm

    ; Check Enter (clear input)
    CMP r6, r14
    JZ r10, handle_enter

    ; Check Backspace
    CMP r6, r8
    JZ r10, handle_backspace

    ; Regular character - store in input buffer
    ; Find end of current input (null terminator)
    LDI r7, 0x2000
    CALL find_end
    ; r7 = address of null terminator
    ; Check buffer not full
    LDI r3, 0x20FF
    CMP r7, r3
    BGE r10, main_loop_continue
    ; Store character
    STORE r7, r6

main_loop_continue:
    FRAME
    JMP main_loop

; --- Send prompt to LLM ---
send_to_llm:
    ; Update status to "Thinking..."
    LDI r7, 0x2500
    LDI r3, 84           ; 'T'
    STORE r7, r3
    LDI r3, 104          ; 'h'
    ADD r7, r2
    STORE r7, r3
    LDI r3, 105          ; 'i'
    ADD r7, r2
    STORE r7, r3
    LDI r3, 110          ; 'n'
    ADD r7, r2
    STORE r7, r3
    LDI r3, 107          ; 'k'
    ADD r7, r2
    STORE r7, r3
    LDI r3, 105          ; 'i'
    ADD r7, r2
    STORE r7, r3
    LDI r3, 110          ; 'n'
    ADD r7, r2
    STORE r7, r3
    LDI r3, 103          ; 'g'
    ADD r7, r2
    STORE r7, r3
    LDI r3, 46           ; '.'
    ADD r7, r2
    STORE r7, r3
    LDI r3, 46           ; '.'
    ADD r7, r2
    STORE r7, r3
    LDI r3, 46           ; '.'
    ADD r7, r2
    STORE r7, r3
    LDI r3, 0            ; null terminate
    ADD r7, r2
    STORE r7, r3

    ; Call LLM opcode: LLM prompt_addr, response_addr, max_len
    LLM r0, r15, r11

    ; r10 = response length
    ; Clear input buffer for next prompt
    LDI r7, 0x2000
    CALL clear_input

    ; Update status
    LDI r7, 0x2500
    LDI r3, 68            ; 'D'
    STORE r7, r3
    LDI r3, 111           ; 'o'
    ADD r7, r2
    STORE r7, r3
    LDI r3, 110           ; 'n'
    ADD r7, r2
    STORE r7, r3
    LDI r3, 101           ; 'e'
    ADD r7, r2
    STORE r7, r3
    LDI r3, 46            ; '.'
    ADD r7, r2
    STORE r7, r3
    LDI r3, 0
    ADD r7, r2
    STORE r7, r3

    JMP main_loop_continue

; --- Handle Enter: clear input and response ---
handle_enter:
    LDI r7, 0x2000
    CALL clear_input
    LDI r7, 0x2100
    CALL clear_input
    JMP main_loop_continue

; --- Handle Backspace ---
handle_backspace:
    LDI r7, 0x2000
    CALL find_end
    ; If at buffer start, ignore
    LDI r3, 0x2000
    CMP r7, r3
    JZ r10, main_loop_continue
    ; Go back one and null-terminate
    SUB r7, r2
    LDI r3, 0
    STORE r7, r3
    JMP main_loop_continue

; --- Draw title bar ---
draw_title:
    PUSH r31
    ; Draw title background
    LDI r7, 0x222244     ; dark purple
    LDI r3, 0
    LDI r4, 0
    LDI r1, 256
    LDI r16, 12
    RECTF r3, r4, r1, r16, r7

    ; Draw "Smart Terminal - Press Tab for AI, Esc to quit"
    ; Use TEXT opcode to render title
    ; Title is stored inline -- write it to RAM first
    LDI r7, 0x2600
    LDI r3, 83           ; 'S'
    STORE r7, r3
    LDI r3, 109          ; 'm'
    ADD r7, r2
    STORE r7, r3
    LDI r3, 97           ; 'a'
    ADD r7, r2
    STORE r7, r3
    LDI r3, 114          ; 'r'
    ADD r7, r2
    STORE r7, r3
    LDI r3, 116          ; 't'
    ADD r7, r2
    STORE r7, r3
    LDI r3, 32           ; ' '
    ADD r7, r2
    STORE r7, r3
    LDI r3, 84           ; 'T'
    ADD r7, r2
    STORE r7, r3
    LDI r3, 101          ; 'e'
    ADD r7, r2
    STORE r7, r3
    LDI r3, 114          ; 'r'
    ADD r7, r2
    STORE r7, r3
    LDI r3, 109          ; 'm'
    ADD r7, r2
    STORE r7, r3
    LDI r3, 0            ; null terminate
    ADD r7, r2
    STORE r7, r3

    ; Render with TEXT opcode
    LDI r7, 0x2600       ; source addr
    LDI r3, 4            ; x
    LDI r4, 2            ; y
    LDI r1, 0xFFFF00     ; yellow
    TEXT r3, r4, r7

    POP r31
    RET

; --- Write status line ---
write_status:
    ; "Tab=AI  Esc=Quit  Enter=Clear"
    PUSH r31
    LDI r7, 0x2500
    LDI r3, 84           ; 'T'
    STORE r7, r3
    LDI r3, 97           ; 'a'
    ADD r7, r2
    STORE r7, r3
    LDI r3, 98           ; 'b'
    ADD r7, r2
    STORE r7, r3
    LDI r3, 61           ; '='
    ADD r7, r2
    STORE r7, r3
    LDI r3, 65           ; 'A'
    ADD r7, r2
    STORE r7, r3
    LDI r3, 73           ; 'I'
    ADD r7, r2
    STORE r7, r3
    LDI r3, 32           ; ' '
    ADD r7, r2
    STORE r7, r3
    LDI r3, 32           ; ' '
    ADD r7, r2
    STORE r7, r3
    LDI r3, 69           ; 'E'
    ADD r7, r2
    STORE r7, r3
    LDI r3, 115          ; 's'
    ADD r7, r2
    STORE r7, r3
    LDI r3, 99           ; 'c'
    ADD r7, r2
    STORE r7, r3
    LDI r3, 61           ; '='
    ADD r7, r2
    STORE r7, r3
    LDI r3, 81           ; 'Q'
    ADD r7, r2
    STORE r7, r3
    LDI r3, 117          ; 'u'
    ADD r7, r2
    STORE r7, r3
    LDI r3, 105          ; 'i'
    ADD r7, r2
    STORE r7, r3
    LDI r3, 116          ; 't'
    ADD r7, r2
    STORE r7, r3
    LDI r3, 0            ; null terminate
    ADD r7, r2
    STORE r7, r3
    POP r31
    RET

; --- Draw text line from RAM buffer ---
; r7 = color, r3 = screen x, r4 = screen y, r1 = RAM addr
draw_text_line:
    PUSH r31
    PUSH r1
    PUSH r7
draw_text_loop:
    LOAD r16, r1
    LDI r7, 0
    CMP r16, r7
    JZ r10, draw_text_done
    PSET r3, r4, r7
    ADD r3, r2
    ADD r1, r2
    JMP draw_text_loop
draw_text_done:
    POP r7
    POP r1
    POP r31
    RET

; --- Find null terminator in buffer ---
; r7 = start address. Returns r7 = address of null.
find_end:
    PUSH r31
    PUSH r2
find_end_loop:
    LOAD r16, r7
    LDI r3, 0
    CMP r16, r3
    JZ r10, find_end_done
    ADD r7, r2
    JMP find_end_loop
find_end_done:
    POP r2
    POP r31
    RET

; --- Clear input buffer (fill with 0) ---
; r7 = buffer start address
clear_input:
    PUSH r31
    PUSH r2
    PUSH r7
    LDI r3, 0
    LDI r16, 256           ; max clear length
clear_loop:
    STORE r7, r3
    ADD r7, r2
    LDI r4, 0
    ADD r4, r7
    LDI r1, 0x2100
    ; Only clear up to response buffer size
    CMP r4, r1
    BGE r10, clear_done
    JMP clear_loop
clear_done:
    POP r7
    POP r2
    POP r31
    RET

done:
    HALT
