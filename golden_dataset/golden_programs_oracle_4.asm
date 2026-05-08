; DESCRIPTION: Draws a colored object at the screen with fixed size.

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
;   r6: CMP result (reserved)
;   r5: Key input
;   r7: Prompt addr (0x3900)
;   r0: Response addr (0x3300)
;   r9: Max response length (768)
;   r1: Constant 1
;   r8: Constant 9 (Tab)
;   r14: Constant 10 (Enter)
;   r13: Constant 8 (Backspace)
;   r2: Constant 27 (Escape)
;   r11-r20: scratch

; ===== Initialize =====
LDI r7, 0x3900          ; full prompt addr
LDI r0, 0x3300          ; response buffer
LDI r9, 768             ; max response length
LDI r1, 1
LDI r8, 9               ; Tab
LDI r14, 10              ; Enter
LDI r13, 8              ; Backspace
LDI r2, 27             ; Escape

; Build map context prefix
CALL build_context

; Clear user input and response
LDI r11, 0x3100
LDI r16, 256
CALL clear_buf
LDI r11, 0x3300
LDI r16, 768
CALL clear_buf

; Status
LDI r11, 0x3700
STRO r11, "Tab=Ask  Esc=Exit  Enter=Clear"

; ===== Main Loop =====
main_loop:
    FILL r6

    ; -- Title bar --
    LDI r11, 0x1A0033   ; dark purple
    LDI r10, 0
    LDI r15, 0
    LDI r4, 256
    LDI r16, 14
    RECTF r10, r15, r4, r16, r11

    LDI r11, 0x3800
    STRO r11, "Oracle - AI Guide"
    LDI r10, 4
    LDI r15, 3
    LDI r4, 0x3800
    TEXT r10, r15, r4

    ; -- Context info line --
    LDI r10, 4
    LDI r15, 16
    LDI r4, 0x3000
    TEXT r10, r15, r4

    ; -- Separator --
    LDI r11, 0x333344
    LDI r10, 0
    LDI r15, 28
    LDI r4, 256
    LDI r16, 1
    RECTF r10, r15, r4, r16, r11

    ; -- User input --
    LDI r10, 4
    LDI r15, 32
    LDI r4, 0x3100
    TEXT r10, r15, r4

    ; -- Response area --
    LDI r10, 4
    LDI r15, 48
    CALL draw_response

    ; -- Status bar --
    LDI r11, 0x111122
    LDI r10, 0
    LDI r15, 248
    LDI r4, 256
    LDI r16, 8
    RECTF r10, r15, r4, r16, r11
    LDI r10, 4
    LDI r15, 248
    LDI r11, 0x3700
    TEXT r10, r15, r11

    ; -- Input --
    IKEY r5
    LDI r11, 0
    ADD r11, r5
    JZ r11, ml_continue

    CMP r5, r2
    JZ r6, done
    CMP r5, r8
    JZ r6, send_to_llm
    CMP r5, r14
    JZ r6, handle_enter
    CMP r5, r13
    JZ r6, handle_backspace

    ; Regular char: append to input buffer
    LDI r11, 0x3100
    CALL find_null
    LDI r10, 0x32FF
    CMP r11, r10
    BGE r6, ml_continue
    STORE r11, r5

ml_continue:
    FRAME
    JMP main_loop

; ===== Send to LLM =====
send_to_llm:
    ; Status: thinking
    LDI r11, 0x3700
    STRO r11, "Thinking..."

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
    LDI r11, 10
    STORE r19, r11
    ADDI r19, 1
    STORE r19, r11
    ADDI r19, 1
    STRO r19, "Question: "
    CALL advance_to_null

    ; Step 3: copy user input
    LDI r18, 0x3100
    CALL copy_until_null

    ; Step 4: append \n\nAnswer concisely.
    SUBI r19, 1
    LDI r11, 10
    STORE r19, r11
    ADDI r19, 1
    STORE r19, r11
    ADDI r19, 1
    STRO r19, "Answer concisely."
    CALL advance_to_null

    ; Call LLM: reads from 0x3900, writes to 0x3300
    LDI r7, 0x3900
    LLM r7, r0, r9

    ; Clear input
    LDI r11, 0x3100
    LDI r16, 256
    CALL clear_buf

    ; Restore status
    LDI r11, 0x3700
    STRO r11, "Tab=Ask  Esc=Exit  Enter=Clear"

    JMP ml_continue

; ===== Handle Enter: clear input + response =====
handle_enter:
    LDI r11, 0x3100
    LDI r16, 256
    CALL clear_buf
    LDI r11, 0x3300
    LDI r16, 768
    CALL clear_buf
    JMP ml_continue

; ===== Handle Backspace =====
handle_backspace:
    LDI r11, 0x3100
    CALL find_null
    LDI r10, 0x3100
    CMP r11, r10
    JZ r6, ml_continue
    SUBI r11, 1
    LDI r10, 0
    STORE r11, r10
    JMP ml_continue

; ===== Build context string at 0x3000 =====
; Uses r19 as output pointer, r11-r18 as scratch
build_context:
    PUSH r31
    LDI r19, 0x3000

    ; "Pos: ("
    STRO r19, "Pos: ("
    CALL advance_to_null

    ; Player X from RAM[0x7808]
    LDI r11, 0x7808
    LOAD r10, r11
    LDI r11, 0
    ADD r11, r10
    CALL write_decimal

    ; ","
    CALL advance_to_null
    STRO r19, ","
    CALL advance_to_null

    ; Player Y from RAM[0x7809]
    LDI r11, 0x7809
    LOAD r10, r11
    LDI r11, 0
    ADD r11, r10
    CALL write_decimal

    ; ") "
    CALL advance_to_null
    STRO r19, ") "
    CALL advance_to_null

    ; Check nearby building
    LDI r11, 0x7588
    LOAD r10, r11
    LDI r15, 1
    CMP r10, r15
    JNZ r6, no_nearby

    ; "Near: "
    STRO r19, "Near: "
    CALL advance_to_null

    ; Read building name: index at 0x7584
    LDI r11, 0x7584
    LOAD r4, r11        ; r4 = building index
    LDI r15, 4
    MUL r4, r15
    LDI r15, 0x7500
    ADD r4, r15         ; r4 = 0x7500 + index*4
    ADDI r4, 3          ; offset to name_addr field
    LOAD r16, r4        ; r16 = name string address
    ; Copy name chars to output
    LDI r11, 0
copy_bname:
    MOV r17, r16
    ADD r17, r11
    LOAD r10, r17
    LDI r18, 0
    CMP r10, r18
    JZ r6, ctx_done
    STORE r19, r10
    ADDI r19, 1
    ADDI r11, 1
    JMP copy_bname

no_nearby:
    STRO r19, "Explore the world!"

ctx_done:
    LDI r11, 0
    STORE r19, r11
    POP r31
    RET

; ===== Write decimal to string at r19 =====
; r11 = number to write
write_decimal:
    PUSH r31
    PUSH r11
    LDI r10, 0
    CMP r11, r10
    JNZ r6, wd_nonzero
    LDI r10, 48
    STORE r19, r10
    ADDI r19, 1
    JMP wd_done

wd_nonzero:
    LDI r15, 0x3E00     ; temp digit buffer
    LDI r4, 0          ; digit count
wd_loop:
    LDI r10, 0
    CMP r11, r10
    JZ r6, wd_reverse
    LDI r10, 10
    MOV r16, r11
    MOD r16, r10
    ADDI r16, 48
    STORE r15, r16
    ADDI r15, 1
    ADDI r4, 1
    DIV r11, r10
    JMP wd_loop

wd_reverse:
    SUBI r15, 1
wd_rev_loop:
    LDI r10, 0
    CMP r4, r10
    JZ r6, wd_done
    LOAD r16, r15
    STORE r19, r16
    ADDI r19, 1
    SUBI r15, 1
    SUBI r4, 1
    JMP wd_rev_loop

wd_done:
    LDI r11, 0
    STORE r19, r11
    POP r11
    POP r31
    RET

; ===== Advance r19 to null terminator =====
advance_to_null:
    PUSH r31
adv_loop:
    LOAD r11, r19
    LDI r10, 0
    CMP r11, r10
    JZ r6, adv_done
    ADDI r19, 1
    JMP adv_loop
adv_done:
    POP r31
    RET

; ===== Copy from r18 to r19 until null =====
copy_until_null:
    PUSH r31
cun_loop:
    LOAD r11, r18
    LDI r10, 0
    CMP r11, r10
    JZ r6, cun_done
    STORE r19, r11
    ADDI r18, 1
    ADDI r19, 1
    JMP cun_loop
cun_done:
    LDI r11, 0
    STORE r19, r11
    POP r31
    RET

; ===== Find null terminator at r11 =====
find_null:
    PUSH r31
fn_loop:
    LOAD r16, r11
    LDI r10, 0
    CMP r16, r10
    JZ r6, fn_done
    ADDI r11, 1
    JMP fn_loop
fn_done:
    POP r31
    RET

; ===== Clear buffer: r11=start, r16=count =====
clear_buf:
    PUSH r31
    PUSH r11
    PUSH r16
    LDI r10, 0
cb_loop:
    JZ r16, cb_done
    STORE r11, r10
    ADDI r11, 1
    SUBI r16, 1
    JMP cb_loop
cb_done:
    POP r16
    POP r11
    POP r31
    RET

; ===== Draw response text =====
; r10 = start x, r15 = start y
; Delegates to TEXT opcode, which wraps at column ~250 and handles \n.
draw_response:
    PUSH r31
    PUSH r11
    LDI r11, 0x3300     ; response buffer
    TEXT r10, r15, r11
    POP r11
    POP r31
    RET

done:
    HALT
