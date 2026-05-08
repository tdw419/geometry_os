; DESCRIPTION: Geometry OS program to draw a colored object.

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
;   r4: CMP result (reserved)
;   r6: Key input from IKEY
;   r0: Cursor position (offset into input buffer)
;   r2: Input buffer base (0x2000)
;   r14: Response buffer base (0x2100)
;   r1: Max response length (256)
;   r11: Response length (from LLM opcode)
;   r13: Constant 1
;   r15: Constant 9 (Tab ASCII)
;   r12: Constant 10 (Enter/LF)
;   r9: Constant 8 (Backspace)
;   r3: Constant 27 (Escape)
;   r7: Loop temp
;   r5: Screen Y for text rendering
;   r8: Constant 32 (space)
;   r10: Tick counter for blinking cursor
;   r16: Color for prompt text

; Initialize constants
LDI r2, 0x2000          ; input buffer base
LDI r14, 0x2100          ; response buffer base
LDI r1, 256             ; max response length
LDI r13, 1
LDI r15, 9               ; Tab
LDI r12, 10              ; LF
LDI r9, 8              ; Backspace
LDI r3, 27             ; Escape
LDI r8, 32             ; Space
LDI r10, 0              ; tick counter
LDI r16, 0x00FF00       ; green color for prompt

; Write title bar
LDI r7, 0
CALL draw_title

; Write prompt indicator "> " at top
LDI r7, 0x2000
LDI r5, 0
CALL clear_input

; Write status line
LDI r7, 0x2500
LDI r5, 0x00FFFF       ; cyan
LDI r8, 28             ; screen Y position
CALL write_status

; Main loop
main_loop:
    FILL r4             ; clear screen (black)
    ; Redraw on every frame

    ; Draw title
    CALL draw_title

    ; Draw input prompt "> " in green
    LDI r7, 0x00FF00   ; green
    LDI r5, 2           ; x
    LDI r8, 4           ; y (below title)
    LDI r10, 0x2000      ; input buffer
    CALL draw_text_line

    ; Draw response in white below input
    LDI r7, 0xFFFFFF   ; white
    LDI r5, 2           ; x
    LDI r8, 6           ; y (below prompt)
    LDI r10, 0x2100      ; response buffer
    CALL draw_text_line

    ; Draw status bar
    LDI r7, 0x00FFFF   ; cyan
    LDI r5, 2           ; x
    LDI r8, 28          ; y (bottom area)
    LDI r10, 0x2500      ; status buffer
    CALL draw_text_line

    ; Read keyboard
    IKEY r6
    LDI r7, 0
    ADD r7, r6
    JZ r7, main_loop_continue

    ; Check Escape
    CMP r6, r3
    JZ r4, done

    ; Check Tab (send to LLM)
    CMP r6, r15
    JZ r4, send_to_llm

    ; Check Enter (clear input)
    CMP r6, r12
    JZ r4, handle_enter

    ; Check Backspace
    CMP r6, r9
    JZ r4, handle_backspace

    ; Regular character - store in input buffer
    ; Find end of current input (null terminator)
    LDI r7, 0x2000
    CALL find_end
    ; r7 = address of null terminator
    ; Check buffer not full
    LDI r5, 0x20FF
    CMP r7, r5
    BGE r4, main_loop_continue
    ; Store character
    STORE r7, r6

main_loop_continue:
    FRAME
    JMP main_loop

; --- Send prompt to LLM ---
send_to_llm:
    ; Update status to "Thinking..."
    LDI r7, 0x2500
    LDI r5, 84           ; 'T'
    STORE r7, r5
    LDI r5, 104          ; 'h'
    ADD r7, r13
    STORE r7, r5
    LDI r5, 105          ; 'i'
    ADD r7, r13
    STORE r7, r5
    LDI r5, 110          ; 'n'
    ADD r7, r13
    STORE r7, r5
    LDI r5, 107          ; 'k'
    ADD r7, r13
    STORE r7, r5
    LDI r5, 105          ; 'i'
    ADD r7, r13
    STORE r7, r5
    LDI r5, 110          ; 'n'
    ADD r7, r13
    STORE r7, r5
    LDI r5, 103          ; 'g'
    ADD r7, r13
    STORE r7, r5
    LDI r5, 46           ; '.'
    ADD r7, r13
    STORE r7, r5
    LDI r5, 46           ; '.'
    ADD r7, r13
    STORE r7, r5
    LDI r5, 46           ; '.'
    ADD r7, r13
    STORE r7, r5
    LDI r5, 0            ; null terminate
    ADD r7, r13
    STORE r7, r5

    ; Call LLM opcode: LLM prompt_addr, response_addr, max_len
    LLM r2, r14, r1

    ; r4 = response length
    ; Clear input buffer for next prompt
    LDI r7, 0x2000
    CALL clear_input

    ; Update status
    LDI r7, 0x2500
    LDI r5, 68            ; 'D'
    STORE r7, r5
    LDI r5, 111           ; 'o'
    ADD r7, r13
    STORE r7, r5
    LDI r5, 110           ; 'n'
    ADD r7, r13
    STORE r7, r5
    LDI r5, 101           ; 'e'
    ADD r7, r13
    STORE r7, r5
    LDI r5, 46            ; '.'
    ADD r7, r13
    STORE r7, r5
    LDI r5, 0
    ADD r7, r13
    STORE r7, r5

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
    LDI r5, 0x2000
    CMP r7, r5
    JZ r4, main_loop_continue
    ; Go back one and null-terminate
    SUB r7, r13
    LDI r5, 0
    STORE r7, r5
    JMP main_loop_continue

; --- Draw title bar ---
draw_title:
    PUSH r31
    ; Draw title background
    LDI r7, 0x222244     ; dark purple
    LDI r5, 0
    LDI r8, 0
    LDI r10, 256
    LDI r16, 12
    RECTF r5, r8, r10, r16, r7

    ; Draw "Smart Terminal - Press Tab for AI, Esc to quit"
    ; Use TEXT opcode to render title
    ; Title is stored inline -- write it to RAM first
    LDI r7, 0x2600
    LDI r5, 83           ; 'S'
    STORE r7, r5
    LDI r5, 109          ; 'm'
    ADD r7, r13
    STORE r7, r5
    LDI r5, 97           ; 'a'
    ADD r7, r13
    STORE r7, r5
    LDI r5, 114          ; 'r'
    ADD r7, r13
    STORE r7, r5
    LDI r5, 116          ; 't'
    ADD r7, r13
    STORE r7, r5
    LDI r5, 32           ; ' '
    ADD r7, r13
    STORE r7, r5
    LDI r5, 84           ; 'T'
    ADD r7, r13
    STORE r7, r5
    LDI r5, 101          ; 'e'
    ADD r7, r13
    STORE r7, r5
    LDI r5, 114          ; 'r'
    ADD r7, r13
    STORE r7, r5
    LDI r5, 109          ; 'm'
    ADD r7, r13
    STORE r7, r5
    LDI r5, 0            ; null terminate
    ADD r7, r13
    STORE r7, r5

    ; Render with TEXT opcode
    LDI r7, 0x2600       ; source addr
    LDI r5, 4            ; x
    LDI r8, 2            ; y
    LDI r10, 0xFFFF00     ; yellow
    TEXT r5, r8, r7

    POP r31
    RET

; --- Write status line ---
write_status:
    ; "Tab=AI  Esc=Quit  Enter=Clear"
    PUSH r31
    LDI r7, 0x2500
    LDI r5, 84           ; 'T'
    STORE r7, r5
    LDI r5, 97           ; 'a'
    ADD r7, r13
    STORE r7, r5
    LDI r5, 98           ; 'b'
    ADD r7, r13
    STORE r7, r5
    LDI r5, 61           ; '='
    ADD r7, r13
    STORE r7, r5
    LDI r5, 65           ; 'A'
    ADD r7, r13
    STORE r7, r5
    LDI r5, 73           ; 'I'
    ADD r7, r13
    STORE r7, r5
    LDI r5, 32           ; ' '
    ADD r7, r13
    STORE r7, r5
    LDI r5, 32           ; ' '
    ADD r7, r13
    STORE r7, r5
    LDI r5, 69           ; 'E'
    ADD r7, r13
    STORE r7, r5
    LDI r5, 115          ; 's'
    ADD r7, r13
    STORE r7, r5
    LDI r5, 99           ; 'c'
    ADD r7, r13
    STORE r7, r5
    LDI r5, 61           ; '='
    ADD r7, r13
    STORE r7, r5
    LDI r5, 81           ; 'Q'
    ADD r7, r13
    STORE r7, r5
    LDI r5, 117          ; 'u'
    ADD r7, r13
    STORE r7, r5
    LDI r5, 105          ; 'i'
    ADD r7, r13
    STORE r7, r5
    LDI r5, 116          ; 't'
    ADD r7, r13
    STORE r7, r5
    LDI r5, 0            ; null terminate
    ADD r7, r13
    STORE r7, r5
    POP r31
    RET

; --- Draw text line from RAM buffer ---
; r7 = color, r5 = screen x, r8 = screen y, r10 = RAM addr
draw_text_line:
    PUSH r31
    PUSH r10
    PUSH r7
draw_text_loop:
    LOAD r16, r10
    LDI r7, 0
    CMP r16, r7
    JZ r4, draw_text_done
    PSET r5, r8, r7
    ADD r5, r13
    ADD r10, r13
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
    PUSH r13
find_end_loop:
    LOAD r16, r7
    LDI r5, 0
    CMP r16, r5
    JZ r4, find_end_done
    ADD r7, r13
    JMP find_end_loop
find_end_done:
    POP r13
    POP r31
    RET

; --- Clear input buffer (fill with 0) ---
; r7 = buffer start address
clear_input:
    PUSH r31
    PUSH r13
    PUSH r7
    LDI r5, 0
    LDI r16, 256           ; max clear length
clear_loop:
    STORE r7, r5
    ADD r7, r13
    LDI r8, 0
    ADD r8, r7
    LDI r10, 0x2100
    ; Only clear up to response buffer size
    CMP r8, r10
    BGE r4, clear_done
    JMP clear_loop
clear_done:
    POP r7
    POP r13
    POP r31
    RET

done:
    HALT
