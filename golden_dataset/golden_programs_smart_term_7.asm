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
;   r3: CMP result (reserved)
;   r14: Key input from IKEY
;   r7: Cursor position (offset into input buffer)
;   r10: Input buffer base (0x2000)
;   r8: Response buffer base (0x2100)
;   r1: Max response length (256)
;   r4: Response length (from LLM opcode)
;   r0: Constant 1
;   r2: Constant 9 (Tab ASCII)
;   r15: Constant 10 (Enter/LF)
;   r13: Constant 8 (Backspace)
;   r11: Constant 27 (Escape)
;   r5: Loop temp
;   r6: Screen Y for text rendering
;   r12: Constant 32 (space)
;   r9: Tick counter for blinking cursor
;   r16: Color for prompt text

; Initialize constants
LDI r10, 0x2000          ; input buffer base
LDI r8, 0x2100          ; response buffer base
LDI r1, 256             ; max response length
LDI r0, 1
LDI r2, 9               ; Tab
LDI r15, 10              ; LF
LDI r13, 8              ; Backspace
LDI r11, 27             ; Escape
LDI r12, 32             ; Space
LDI r9, 0              ; tick counter
LDI r16, 0x00FF00       ; green color for prompt

; Write title bar
LDI r5, 0
CALL draw_title

; Write prompt indicator "> " at top
LDI r5, 0x2000
LDI r6, 0
CALL clear_input

; Write status line
LDI r5, 0x2500
LDI r6, 0x00FFFF       ; cyan
LDI r12, 28             ; screen Y position
CALL write_status

; Main loop
main_loop:
    FILL r3             ; clear screen (black)
    ; Redraw on every frame

    ; Draw title
    CALL draw_title

    ; Draw input prompt "> " in green
    LDI r5, 0x00FF00   ; green
    LDI r6, 2           ; x
    LDI r12, 4           ; y (below title)
    LDI r9, 0x2000      ; input buffer
    CALL draw_text_line

    ; Draw response in white below input
    LDI r5, 0xFFFFFF   ; white
    LDI r6, 2           ; x
    LDI r12, 6           ; y (below prompt)
    LDI r9, 0x2100      ; response buffer
    CALL draw_text_line

    ; Draw status bar
    LDI r5, 0x00FFFF   ; cyan
    LDI r6, 2           ; x
    LDI r12, 28          ; y (bottom area)
    LDI r9, 0x2500      ; status buffer
    CALL draw_text_line

    ; Read keyboard
    IKEY r14
    LDI r5, 0
    ADD r5, r14
    JZ r5, main_loop_continue

    ; Check Escape
    CMP r14, r11
    JZ r3, done

    ; Check Tab (send to LLM)
    CMP r14, r2
    JZ r3, send_to_llm

    ; Check Enter (clear input)
    CMP r14, r15
    JZ r3, handle_enter

    ; Check Backspace
    CMP r14, r13
    JZ r3, handle_backspace

    ; Regular character - store in input buffer
    ; Find end of current input (null terminator)
    LDI r5, 0x2000
    CALL find_end
    ; r5 = address of null terminator
    ; Check buffer not full
    LDI r6, 0x20FF
    CMP r5, r6
    BGE r3, main_loop_continue
    ; Store character
    STORE r5, r14

main_loop_continue:
    FRAME
    JMP main_loop

; --- Send prompt to LLM ---
send_to_llm:
    ; Update status to "Thinking..."
    LDI r5, 0x2500
    LDI r6, 84           ; 'T'
    STORE r5, r6
    LDI r6, 104          ; 'h'
    ADD r5, r0
    STORE r5, r6
    LDI r6, 105          ; 'i'
    ADD r5, r0
    STORE r5, r6
    LDI r6, 110          ; 'n'
    ADD r5, r0
    STORE r5, r6
    LDI r6, 107          ; 'k'
    ADD r5, r0
    STORE r5, r6
    LDI r6, 105          ; 'i'
    ADD r5, r0
    STORE r5, r6
    LDI r6, 110          ; 'n'
    ADD r5, r0
    STORE r5, r6
    LDI r6, 103          ; 'g'
    ADD r5, r0
    STORE r5, r6
    LDI r6, 46           ; '.'
    ADD r5, r0
    STORE r5, r6
    LDI r6, 46           ; '.'
    ADD r5, r0
    STORE r5, r6
    LDI r6, 46           ; '.'
    ADD r5, r0
    STORE r5, r6
    LDI r6, 0            ; null terminate
    ADD r5, r0
    STORE r5, r6

    ; Call LLM opcode: LLM prompt_addr, response_addr, max_len
    LLM r10, r8, r1

    ; r3 = response length
    ; Clear input buffer for next prompt
    LDI r5, 0x2000
    CALL clear_input

    ; Update status
    LDI r5, 0x2500
    LDI r6, 68            ; 'D'
    STORE r5, r6
    LDI r6, 111           ; 'o'
    ADD r5, r0
    STORE r5, r6
    LDI r6, 110           ; 'n'
    ADD r5, r0
    STORE r5, r6
    LDI r6, 101           ; 'e'
    ADD r5, r0
    STORE r5, r6
    LDI r6, 46            ; '.'
    ADD r5, r0
    STORE r5, r6
    LDI r6, 0
    ADD r5, r0
    STORE r5, r6

    JMP main_loop_continue

; --- Handle Enter: clear input and response ---
handle_enter:
    LDI r5, 0x2000
    CALL clear_input
    LDI r5, 0x2100
    CALL clear_input
    JMP main_loop_continue

; --- Handle Backspace ---
handle_backspace:
    LDI r5, 0x2000
    CALL find_end
    ; If at buffer start, ignore
    LDI r6, 0x2000
    CMP r5, r6
    JZ r3, main_loop_continue
    ; Go back one and null-terminate
    SUB r5, r0
    LDI r6, 0
    STORE r5, r6
    JMP main_loop_continue

; --- Draw title bar ---
draw_title:
    PUSH r31
    ; Draw title background
    LDI r5, 0x222244     ; dark purple
    LDI r6, 0
    LDI r12, 0
    LDI r9, 256
    LDI r16, 12
    RECTF r6, r12, r9, r16, r5

    ; Draw "Smart Terminal - Press Tab for AI, Esc to quit"
    ; Use TEXT opcode to render title
    ; Title is stored inline -- write it to RAM first
    LDI r5, 0x2600
    LDI r6, 83           ; 'S'
    STORE r5, r6
    LDI r6, 109          ; 'm'
    ADD r5, r0
    STORE r5, r6
    LDI r6, 97           ; 'a'
    ADD r5, r0
    STORE r5, r6
    LDI r6, 114          ; 'r'
    ADD r5, r0
    STORE r5, r6
    LDI r6, 116          ; 't'
    ADD r5, r0
    STORE r5, r6
    LDI r6, 32           ; ' '
    ADD r5, r0
    STORE r5, r6
    LDI r6, 84           ; 'T'
    ADD r5, r0
    STORE r5, r6
    LDI r6, 101          ; 'e'
    ADD r5, r0
    STORE r5, r6
    LDI r6, 114          ; 'r'
    ADD r5, r0
    STORE r5, r6
    LDI r6, 109          ; 'm'
    ADD r5, r0
    STORE r5, r6
    LDI r6, 0            ; null terminate
    ADD r5, r0
    STORE r5, r6

    ; Render with TEXT opcode
    LDI r5, 0x2600       ; source addr
    LDI r6, 4            ; x
    LDI r12, 2            ; y
    LDI r9, 0xFFFF00     ; yellow
    TEXT r6, r12, r5

    POP r31
    RET

; --- Write status line ---
write_status:
    ; "Tab=AI  Esc=Quit  Enter=Clear"
    PUSH r31
    LDI r5, 0x2500
    LDI r6, 84           ; 'T'
    STORE r5, r6
    LDI r6, 97           ; 'a'
    ADD r5, r0
    STORE r5, r6
    LDI r6, 98           ; 'b'
    ADD r5, r0
    STORE r5, r6
    LDI r6, 61           ; '='
    ADD r5, r0
    STORE r5, r6
    LDI r6, 65           ; 'A'
    ADD r5, r0
    STORE r5, r6
    LDI r6, 73           ; 'I'
    ADD r5, r0
    STORE r5, r6
    LDI r6, 32           ; ' '
    ADD r5, r0
    STORE r5, r6
    LDI r6, 32           ; ' '
    ADD r5, r0
    STORE r5, r6
    LDI r6, 69           ; 'E'
    ADD r5, r0
    STORE r5, r6
    LDI r6, 115          ; 's'
    ADD r5, r0
    STORE r5, r6
    LDI r6, 99           ; 'c'
    ADD r5, r0
    STORE r5, r6
    LDI r6, 61           ; '='
    ADD r5, r0
    STORE r5, r6
    LDI r6, 81           ; 'Q'
    ADD r5, r0
    STORE r5, r6
    LDI r6, 117          ; 'u'
    ADD r5, r0
    STORE r5, r6
    LDI r6, 105          ; 'i'
    ADD r5, r0
    STORE r5, r6
    LDI r6, 116          ; 't'
    ADD r5, r0
    STORE r5, r6
    LDI r6, 0            ; null terminate
    ADD r5, r0
    STORE r5, r6
    POP r31
    RET

; --- Draw text line from RAM buffer ---
; r5 = color, r6 = screen x, r12 = screen y, r9 = RAM addr
draw_text_line:
    PUSH r31
    PUSH r9
    PUSH r5
draw_text_loop:
    LOAD r16, r9
    LDI r5, 0
    CMP r16, r5
    JZ r3, draw_text_done
    PSET r6, r12, r5
    ADD r6, r0
    ADD r9, r0
    JMP draw_text_loop
draw_text_done:
    POP r5
    POP r9
    POP r31
    RET

; --- Find null terminator in buffer ---
; r5 = start address. Returns r5 = address of null.
find_end:
    PUSH r31
    PUSH r0
find_end_loop:
    LOAD r16, r5
    LDI r6, 0
    CMP r16, r6
    JZ r3, find_end_done
    ADD r5, r0
    JMP find_end_loop
find_end_done:
    POP r0
    POP r31
    RET

; --- Clear input buffer (fill with 0) ---
; r5 = buffer start address
clear_input:
    PUSH r31
    PUSH r0
    PUSH r5
    LDI r6, 0
    LDI r16, 256           ; max clear length
clear_loop:
    STORE r5, r6
    ADD r5, r0
    LDI r12, 0
    ADD r12, r5
    LDI r9, 0x2100
    ; Only clear up to response buffer size
    CMP r12, r9
    BGE r3, clear_done
    JMP clear_loop
clear_done:
    POP r5
    POP r0
    POP r31
    RET

done:
    HALT
