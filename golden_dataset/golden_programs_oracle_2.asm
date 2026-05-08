; DESCRIPTION: Render a colored object at the screen.

; oracle.asm -- Map-aware AI Oracle building
; Walk in, ask questions about the world. The LLM knows your position and
; nearby buildings. Type a question, press Tab to ask. Response appears below.
; Uses LLM opcode (0x9C) to send map-aware prompts to external AI.
;
; Memory layout:
;   0x3000-0x30FF: Context string (player pos, nearby buildings)
;   0x3100-0x32FF: User input buffer (typed question)
;   0x3300-0x36FF: Response buffer (LLM response, up to 1K)
;   0x3700-0x37FF: Status line
;   0x3800-0x3820: Title text
;   0x3900-0x39FF: Full prompt (context + question) sent to LLM
;   0x3E00-0x3FFF: Temp digit buffer / scratch
;
; Registers:
;   r8: CMP result (reserved)
;   r14: Key input
;   r2: Prompt addr (0x3900)
;   r6: Response addr (0x3300)
;   r4: Max response length (768)
;   r7: Constant 1
;   r5: Constant 9 (Tab)
;   r1: Constant 10 (Enter)
;   r3: Constant 8 (Backspace)
;   r12: Constant 27 (Escape)
;   r10-r20: scratch

; ===== Initialize =====
LDI r2, 0x3900          ; full prompt addr
LDI r6, 0x3300          ; response buffer
LDI r4, 768             ; max response length
LDI r7, 1
LDI r5, 9               ; Tab
LDI r1, 10              ; Enter
LDI r3, 8              ; Backspace
LDI r12, 27             ; Escape

; Build map context prefix
CALL build_context

; Clear user input and response
LDI r10, 0x3100
LDI r16, 256
CALL clear_buf
LDI r10, 0x3300
LDI r16, 768
CALL clear_buf

; Status
LDI r10, 0x3700
STRO r10, "Tab=Ask  Esc=Exit  Enter=Clear"

; ===== Main Loop =====
main_loop:
    FILL r8

    ; -- Title bar --
    LDI r10, 0x1A0033   ; dark purple
    LDI r9, 0
    LDI r13, 0
    LDI r11, 256
    LDI r16, 14
    RECTF r9, r13, r11, r16, r10

    LDI r10, 0x3800
    STRO r10, "Oracle - AI Guide"
    LDI r9, 4
    LDI r13, 3
    LDI r11, 0x3800
    TEXT r9, r13, r11

    ; -- Context info line --
    LDI r9, 4
    LDI r13, 16
    LDI r11, 0x3000
    TEXT r9, r13, r11

    ; -- Separator --
    LDI r10, 0x333344
    LDI r9, 0
    LDI r13, 28
    LDI r11, 256
    LDI r16, 1
    RECTF r9, r13, r11, r16, r10

    ; -- User input --
    LDI r9, 4
    LDI r13, 32
    LDI r11, 0x3100
    TEXT r9, r13, r11

    ; -- Response area --
    LDI r9, 4
    LDI r13, 48
    CALL draw_response

    ; -- Status bar --
    LDI r10, 0x111122
    LDI r9, 0
    LDI r13, 248
    LDI r11, 256
    LDI r16, 8
    RECTF r9, r13, r11, r16, r10
    LDI r9, 4
    LDI r13, 248
    LDI r10, 0x3700
    TEXT r9, r13, r10

    ; -- Input --
    IKEY r14
    LDI r10, 0
    ADD r10, r14
    JZ r10, ml_continue

    CMP r14, r12
    JZ r8, done
    CMP r14, r5
    JZ r8, send_to_llm
    CMP r14, r1
    JZ r8, handle_enter
    CMP r14, r3
    JZ r8, handle_backspace

    ; Regular char: append to input buffer
    LDI r10, 0x3100
    CALL find_null
    LDI r9, 0x32FF
    CMP r10, r9
    BGE r8, ml_continue
    STORE r10, r14

ml_continue:
    FRAME
    JMP main_loop

; ===== Send to LLM =====
send_to_llm:
    ; Status: thinking
    LDI r10, 0x3700
    STRO r10, "Thinking..."

    ; Build full prompt at 0x3900:
    ;   1. Copy context from 0x3000
    ;   2. Append "\n\nQuestion: "
    ;   3. Append user input from 0x3100
    ;   4. Append "\n\nAnswer concisely."

    ; Step 1: copy context
    LDI r18, 0x3000
    LDI r19, 0x3900
    CALL copy_until_null

    ; Step 2: append \n\nQuestion:
    SUBI r19, 1         ; back over null
    LDI r10, 10
    STORE r19, r10
    ADDI r19, 1
    STORE r19, r10
    ADDI r19, 1
    STRO r19, "Question: "
    CALL advance_to_null

    ; Step 3: copy user input
    LDI r18, 0x3100
    CALL copy_until_null

    ; Step 4: append \n\nAnswer concisely.
    SUBI r19, 1
    LDI r10, 10
    STORE r19, r10
    ADDI r19, 1
    STORE r19, r10
    ADDI r19, 1
    STRO r19, "Answer concisely."
    CALL advance_to_null

    ; Call LLM: reads from 0x3900, writes to 0x3300
    LDI r2, 0x3900
    LLM r2, r6, r4

    ; Clear input
    LDI r10, 0x3100
    LDI r16, 256
    CALL clear_buf

    ; Restore status
    LDI r10, 0x3700
    STRO r10, "Tab=Ask  Esc=Exit  Enter=Clear"

    JMP ml_continue

; ===== Handle Enter: clear input + response =====
handle_enter:
    LDI r10, 0x3100
    LDI r16, 256
    CALL clear_buf
    LDI r10, 0x3300
    LDI r16, 768
    CALL clear_buf
    JMP ml_continue

; ===== Handle Backspace =====
handle_backspace:
    LDI r10, 0x3100
    CALL find_null
    LDI r9, 0x3100
    CMP r10, r9
    JZ r8, ml_continue
    SUBI r10, 1
    LDI r9, 0
    STORE r10, r9
    JMP ml_continue

; ===== Build context string at 0x3000 =====
; Uses r19 as output pointer, r10-r18 as scratch
build_context:
    PUSH r31
    LDI r19, 0x3000

    ; "Pos: ("
    STRO r19, "Pos: ("
    CALL advance_to_null

    ; Player X from RAM[0x7808]
    LDI r10, 0x7808
    LOAD r9, r10
    LDI r10, 0
    ADD r10, r9
    CALL write_decimal

    ; ","
    CALL advance_to_null
    STRO r19, ","
    CALL advance_to_null

    ; Player Y from RAM[0x7809]
    LDI r10, 0x7809
    LOAD r9, r10
    LDI r10, 0
    ADD r10, r9
    CALL write_decimal

    ; ") "
    CALL advance_to_null
    STRO r19, ") "
    CALL advance_to_null

    ; Check nearby building
    LDI r10, 0x7588
    LOAD r9, r10
    LDI r13, 1
    CMP r9, r13
    JNZ r8, no_nearby

    ; "Near: "
    STRO r19, "Near: "
    CALL advance_to_null

    ; Read building name: index at 0x7584
    LDI r10, 0x7584
    LOAD r11, r10        ; r11 = building index
    LDI r13, 4
    MUL r11, r13
    LDI r13, 0x7500
    ADD r11, r13         ; r11 = 0x7500 + index*4
    ADDI r11, 3          ; offset to name_addr field
    LOAD r16, r11        ; r16 = name string address
    ; Copy name chars to output
    LDI r10, 0
copy_bname:
    MOV r17, r16
    ADD r17, r10
    LOAD r9, r17
    LDI r18, 0
    CMP r9, r18
    JZ r8, ctx_done
    STORE r19, r9
    ADDI r19, 1
    ADDI r10, 1
    JMP copy_bname

no_nearby:
    STRO r19, "Explore the world!"

ctx_done:
    LDI r10, 0
    STORE r19, r10
    POP r31
    RET

; ===== Write decimal to string at r19 =====
; r10 = number to write
write_decimal:
    PUSH r31
    PUSH r10
    LDI r9, 0
    CMP r10, r9
    JNZ r8, wd_nonzero
    LDI r9, 48
    STORE r19, r9
    ADDI r19, 1
    JMP wd_done

wd_nonzero:
    LDI r13, 0x3E00     ; temp digit buffer
    LDI r11, 0          ; digit count
wd_loop:
    LDI r9, 0
    CMP r10, r9
    JZ r8, wd_reverse
    LDI r9, 10
    MOV r16, r10
    MOD r16, r9
    ADDI r16, 48
    STORE r13, r16
    ADDI r13, 1
    ADDI r11, 1
    DIV r10, r9
    JMP wd_loop

wd_reverse:
    SUBI r13, 1
wd_rev_loop:
    LDI r9, 0
    CMP r11, r9
    JZ r8, wd_done
    LOAD r16, r13
    STORE r19, r16
    ADDI r19, 1
    SUBI r13, 1
    SUBI r11, 1
    JMP wd_rev_loop

wd_done:
    LDI r10, 0
    STORE r19, r10
    POP r10
    POP r31
    RET

; ===== Advance r19 to null terminator =====
advance_to_null:
    PUSH r31
adv_loop:
    LOAD r10, r19
    LDI r9, 0
    CMP r10, r9
    JZ r8, adv_done
    ADDI r19, 1
    JMP adv_loop
adv_done:
    POP r31
    RET

; ===== Copy from r18 to r19 until null =====
copy_until_null:
    PUSH r31
cun_loop:
    LOAD r10, r18
    LDI r9, 0
    CMP r10, r9
    JZ r8, cun_done
    STORE r19, r10
    ADDI r18, 1
    ADDI r19, 1
    JMP cun_loop
cun_done:
    LDI r10, 0
    STORE r19, r10
    POP r31
    RET

; ===== Find null terminator at r10 =====
find_null:
    PUSH r31
fn_loop:
    LOAD r16, r10
    LDI r9, 0
    CMP r16, r9
    JZ r8, fn_done
    ADDI r10, 1
    JMP fn_loop
fn_done:
    POP r31
    RET

; ===== Clear buffer: r10=start, r16=count =====
clear_buf:
    PUSH r31
    PUSH r10
    PUSH r16
    LDI r9, 0
cb_loop:
    JZ r16, cb_done
    STORE r10, r9
    ADDI r10, 1
    SUBI r16, 1
    JMP cb_loop
cb_done:
    POP r16
    POP r10
    POP r31
    RET

; ===== Draw response text =====
; r9 = start x, r13 = start y
; Delegates to TEXT opcode, which wraps at column ~250 and handles \n.
draw_response:
    PUSH r31
    PUSH r10
    LDI r10, 0x3300     ; response buffer
    TEXT r9, r13, r10
    POP r10
    POP r31
    RET

done:
    HALT
