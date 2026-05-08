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
;   r1: CMP result (reserved)
;   r15: Key input from IKEY
;   r3: Cursor position (offset into input buffer)
;   r11: Input buffer base (0x2000)
;   r8: Response buffer base (0x2100)
;   r4: Max response length (256)
;   r5: Response length (from LLM opcode)
;   r0: Constant 1
;   r13: Constant 9 (Tab ASCII)
;   r14: Constant 10 (Enter/LF)
;   r9: Constant 8 (Backspace)
;   r6: Constant 27 (Escape)
;   r7: Loop temp
;   r2: Screen Y for text rendering
;   r12: Constant 32 (space)
;   r10: Tick counter for blinking cursor
;   r16: Color for prompt text

; Initialize constants
LDI r11, 0x2000          ; input buffer base
LDI r8, 0x2100          ; response buffer base
LDI r4, 256             ; max response length
LDI r0, 1
LDI r13, 9               ; Tab
LDI r14, 10              ; LF
LDI r9, 8              ; Backspace
LDI r6, 27             ; Escape
LDI r12, 32             ; Space
LDI r10, 0              ; tick counter
LDI r16, 0x00FF00       ; green color for prompt

; Write title bar
LDI r7, 0
CALL draw_title

; Write prompt indicator "> " at top
LDI r7, 0x2000
LDI r2, 0
CALL clear_input

; Write status line
LDI r7, 0x2500
LDI r2, 0x00FFFF       ; cyan
LDI r12, 28             ; screen Y position
CALL write_status

; Main loop
main_loop:
    FILL r1             ; clear screen (black)
    ; Redraw on every frame

    ; Draw title
    CALL draw_title

    ; Draw input prompt "> " in green
    LDI r7, 0x00FF00   ; green
    LDI r2, 2           ; x
    LDI r12, 4           ; y (below title)
    LDI r10, 0x2000      ; input buffer
    CALL draw_text_line

    ; Draw response in white below input
    LDI r7, 0xFFFFFF   ; white
    LDI r2, 2           ; x
    LDI r12, 6           ; y (below prompt)
    LDI r10, 0x2100      ; response buffer
    CALL draw_text_line

    ; Draw status bar
    LDI r7, 0x00FFFF   ; cyan
    LDI r2, 2           ; x
    LDI r12, 28          ; y (bottom area)
    LDI r10, 0x2500      ; status buffer
    CALL draw_text_line

    ; Read keyboard
    IKEY r15
    LDI r7, 0
    ADD r7, r15
    JZ r7, main_loop_continue

    ; Check Escape
    CMP r15, r6
    JZ r1, done

    ; Check Tab (send to LLM)
    CMP r15, r13
    JZ r1, send_to_llm

    ; Check Enter (clear input)
    CMP r15, r14
    JZ r1, handle_enter

    ; Check Backspace
    CMP r15, r9
    JZ r1, handle_backspace

    ; Regular character - store in input buffer
    ; Find end of current input (null terminator)
    LDI r7, 0x2000
    CALL find_end
    ; r7 = address of null terminator
    ; Check buffer not full
    LDI r2, 0x20FF
    CMP r7, r2
    BGE r1, main_loop_continue
    ; Store character
    STORE r7, r15

main_loop_continue:
    FRAME
    JMP main_loop

; --- Send prompt to LLM ---
send_to_llm:
    ; Update status to "Thinking..."
    LDI r7, 0x2500
    LDI r2, 84           ; 'T'
    STORE r7, r2
    LDI r2, 104          ; 'h'
    ADD r7, r0
    STORE r7, r2
    LDI r2, 105          ; 'i'
    ADD r7, r0
    STORE r7, r2
    LDI r2, 110          ; 'n'
    ADD r7, r0
    STORE r7, r2
    LDI r2, 107          ; 'k'
    ADD r7, r0
    STORE r7, r2
    LDI r2, 105          ; 'i'
    ADD r7, r0
    STORE r7, r2
    LDI r2, 110          ; 'n'
    ADD r7, r0
    STORE r7, r2
    LDI r2, 103          ; 'g'
    ADD r7, r0
    STORE r7, r2
    LDI r2, 46           ; '.'
    ADD r7, r0
    STORE r7, r2
    LDI r2, 46           ; '.'
    ADD r7, r0
    STORE r7, r2
    LDI r2, 46           ; '.'
    ADD r7, r0
    STORE r7, r2
    LDI r2, 0            ; null terminate
    ADD r7, r0
    STORE r7, r2

    ; Call LLM opcode: LLM prompt_addr, response_addr, max_len
    LLM r11, r8, r4

    ; r1 = response length
    ; Clear input buffer for next prompt
    LDI r7, 0x2000
    CALL clear_input

    ; Update status
    LDI r7, 0x2500
    LDI r2, 68            ; 'D'
    STORE r7, r2
    LDI r2, 111           ; 'o'
    ADD r7, r0
    STORE r7, r2
    LDI r2, 110           ; 'n'
    ADD r7, r0
    STORE r7, r2
    LDI r2, 101           ; 'e'
    ADD r7, r0
    STORE r7, r2
    LDI r2, 46            ; '.'
    ADD r7, r0
    STORE r7, r2
    LDI r2, 0
    ADD r7, r0
    STORE r7, r2

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
    LDI r2, 0x2000
    CMP r7, r2
    JZ r1, main_loop_continue
    ; Go back one and null-terminate
    SUB r7, r0
    LDI r2, 0
    STORE r7, r2
    JMP main_loop_continue

; --- Draw title bar ---
draw_title:
    PUSH r31
    ; Draw title background
    LDI r7, 0x222244     ; dark purple
    LDI r2, 0
    LDI r12, 0
    LDI r10, 256
    LDI r16, 12
    RECTF r2, r12, r10, r16, r7

    ; Draw "Smart Terminal - Press Tab for AI, Esc to quit"
    ; Use TEXT opcode to render title
    ; Title is stored inline -- write it to RAM first
    LDI r7, 0x2600
    LDI r2, 83           ; 'S'
    STORE r7, r2
    LDI r2, 109          ; 'm'
    ADD r7, r0
    STORE r7, r2
    LDI r2, 97           ; 'a'
    ADD r7, r0
    STORE r7, r2
    LDI r2, 114          ; 'r'
    ADD r7, r0
    STORE r7, r2
    LDI r2, 116          ; 't'
    ADD r7, r0
    STORE r7, r2
    LDI r2, 32           ; ' '
    ADD r7, r0
    STORE r7, r2
    LDI r2, 84           ; 'T'
    ADD r7, r0
    STORE r7, r2
    LDI r2, 101          ; 'e'
    ADD r7, r0
    STORE r7, r2
    LDI r2, 114          ; 'r'
    ADD r7, r0
    STORE r7, r2
    LDI r2, 109          ; 'm'
    ADD r7, r0
    STORE r7, r2
    LDI r2, 0            ; null terminate
    ADD r7, r0
    STORE r7, r2

    ; Render with TEXT opcode
    LDI r7, 0x2600       ; source addr
    LDI r2, 4            ; x
    LDI r12, 2            ; y
    LDI r10, 0xFFFF00     ; yellow
    TEXT r2, r12, r7

    POP r31
    RET

; --- Write status line ---
write_status:
    ; "Tab=AI  Esc=Quit  Enter=Clear"
    PUSH r31
    LDI r7, 0x2500
    LDI r2, 84           ; 'T'
    STORE r7, r2
    LDI r2, 97           ; 'a'
    ADD r7, r0
    STORE r7, r2
    LDI r2, 98           ; 'b'
    ADD r7, r0
    STORE r7, r2
    LDI r2, 61           ; '='
    ADD r7, r0
    STORE r7, r2
    LDI r2, 65           ; 'A'
    ADD r7, r0
    STORE r7, r2
    LDI r2, 73           ; 'I'
    ADD r7, r0
    STORE r7, r2
    LDI r2, 32           ; ' '
    ADD r7, r0
    STORE r7, r2
    LDI r2, 32           ; ' '
    ADD r7, r0
    STORE r7, r2
    LDI r2, 69           ; 'E'
    ADD r7, r0
    STORE r7, r2
    LDI r2, 115          ; 's'
    ADD r7, r0
    STORE r7, r2
    LDI r2, 99           ; 'c'
    ADD r7, r0
    STORE r7, r2
    LDI r2, 61           ; '='
    ADD r7, r0
    STORE r7, r2
    LDI r2, 81           ; 'Q'
    ADD r7, r0
    STORE r7, r2
    LDI r2, 117          ; 'u'
    ADD r7, r0
    STORE r7, r2
    LDI r2, 105          ; 'i'
    ADD r7, r0
    STORE r7, r2
    LDI r2, 116          ; 't'
    ADD r7, r0
    STORE r7, r2
    LDI r2, 0            ; null terminate
    ADD r7, r0
    STORE r7, r2
    POP r31
    RET

; --- Draw text line from RAM buffer ---
; r7 = color, r2 = screen x, r12 = screen y, r10 = RAM addr
draw_text_line:
    PUSH r31
    PUSH r10
    PUSH r7
draw_text_loop:
    LOAD r16, r10
    LDI r7, 0
    CMP r16, r7
    JZ r1, draw_text_done
    PSET r2, r12, r7
    ADD r2, r0
    ADD r10, r0
    JMP draw_text_loop
draw_text_done:
    POP r7
    POP r10
    POP r31
    RET

; --- Find null terminator in buffer ---
; r7 = start address. Returns r7 = address of null.
find_end:
    PUSH r31
    PUSH r0
find_end_loop:
    LOAD r16, r7
    LDI r2, 0
    CMP r16, r2
    JZ r1, find_end_done
    ADD r7, r0
    JMP find_end_loop
find_end_done:
    POP r0
    POP r31
    RET

; --- Clear input buffer (fill with 0) ---
; r7 = buffer start address
clear_input:
    PUSH r31
    PUSH r0
    PUSH r7
    LDI r2, 0
    LDI r16, 256           ; max clear length
clear_loop:
    STORE r7, r2
    ADD r7, r0
    LDI r12, 0
    ADD r12, r7
    LDI r10, 0x2100
    ; Only clear up to response buffer size
    CMP r12, r10
    BGE r1, clear_done
    JMP clear_loop
clear_done:
    POP r7
    POP r0
    POP r31
    RET

done:
    HALT
