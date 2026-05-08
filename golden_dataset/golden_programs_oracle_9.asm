; DESCRIPTION: Geometry OS program to draw a colored object.

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
;   r12: CMP result (reserved)
;   r2: Key input
;   r3: Prompt addr (0x3900)
;   r15: Response addr (0x3300)
;   r10: Max response length (768)
;   r0: Constant 1
;   r8: Constant 9 (Tab)
;   r7: Constant 10 (Enter)
;   r4: Constant 8 (Backspace)
;   r14: Constant 27 (Escape)
;   r5-r20: scratch

; ===== Initialize =====
LDI r3, 0x3900          ; full prompt addr
LDI r15, 0x3300          ; response buffer
LDI r10, 768             ; max response length
LDI r0, 1
LDI r8, 9               ; Tab
LDI r7, 10              ; Enter
LDI r4, 8              ; Backspace
LDI r14, 27             ; Escape

; Build map context prefix
CALL build_context

; Clear user input and response
LDI r5, 0x3100
LDI r16, 256
CALL clear_buf
LDI r5, 0x3300
LDI r16, 768
CALL clear_buf

; Status
LDI r5, 0x3700
STRO r5, "Tab=Ask  Esc=Exit  Enter=Clear"

; ===== Main Loop =====
main_loop:
    FILL r12

    ; -- Title bar --
    LDI r5, 0x1A0033   ; dark purple
    LDI r11, 0
    LDI r6, 0
    LDI r13, 256
    LDI r16, 14
    RECTF r11, r6, r13, r16, r5

    LDI r5, 0x3800
    STRO r5, "Oracle - AI Guide"
    LDI r11, 4
    LDI r6, 3
    LDI r13, 0x3800
    TEXT r11, r6, r13

    ; -- Context info line --
    LDI r11, 4
    LDI r6, 16
    LDI r13, 0x3000
    TEXT r11, r6, r13

    ; -- Separator --
    LDI r5, 0x333344
    LDI r11, 0
    LDI r6, 28
    LDI r13, 256
    LDI r16, 1
    RECTF r11, r6, r13, r16, r5

    ; -- User input --
    LDI r11, 4
    LDI r6, 32
    LDI r13, 0x3100
    TEXT r11, r6, r13

    ; -- Response area --
    LDI r11, 4
    LDI r6, 48
    CALL draw_response

    ; -- Status bar --
    LDI r5, 0x111122
    LDI r11, 0
    LDI r6, 248
    LDI r13, 256
    LDI r16, 8
    RECTF r11, r6, r13, r16, r5
    LDI r11, 4
    LDI r6, 248
    LDI r5, 0x3700
    TEXT r11, r6, r5

    ; -- Input --
    IKEY r2
    LDI r5, 0
    ADD r5, r2
    JZ r5, ml_continue

    CMP r2, r14
    JZ r12, done
    CMP r2, r8
    JZ r12, send_to_llm
    CMP r2, r7
    JZ r12, handle_enter
    CMP r2, r4
    JZ r12, handle_backspace

    ; Regular char: append to input buffer
    LDI r5, 0x3100
    CALL find_null
    LDI r11, 0x32FF
    CMP r5, r11
    BGE r12, ml_continue
    STORE r5, r2

ml_continue:
    FRAME
    JMP main_loop

; ===== Send to LLM =====
send_to_llm:
    ; Status: thinking
    LDI r5, 0x3700
    STRO r5, "Thinking..."

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
    LDI r5, 10
    STORE r19, r5
    ADDI r19, 1
    STORE r19, r5
    ADDI r19, 1
    STRO r19, "Question: "
    CALL advance_to_null

    ; Step 3: copy user input
    LDI r18, 0x3100
    CALL copy_until_null

    ; Step 4: append \n\nAnswer concisely.
    SUBI r19, 1
    LDI r5, 10
    STORE r19, r5
    ADDI r19, 1
    STORE r19, r5
    ADDI r19, 1
    STRO r19, "Answer concisely."
    CALL advance_to_null

    ; Call LLM: reads from 0x3900, writes to 0x3300
    LDI r3, 0x3900
    LLM r3, r15, r10

    ; Clear input
    LDI r5, 0x3100
    LDI r16, 256
    CALL clear_buf

    ; Restore status
    LDI r5, 0x3700
    STRO r5, "Tab=Ask  Esc=Exit  Enter=Clear"

    JMP ml_continue

; ===== Handle Enter: clear input + response =====
handle_enter:
    LDI r5, 0x3100
    LDI r16, 256
    CALL clear_buf
    LDI r5, 0x3300
    LDI r16, 768
    CALL clear_buf
    JMP ml_continue

; ===== Handle Backspace =====
handle_backspace:
    LDI r5, 0x3100
    CALL find_null
    LDI r11, 0x3100
    CMP r5, r11
    JZ r12, ml_continue
    SUBI r5, 1
    LDI r11, 0
    STORE r5, r11
    JMP ml_continue

; ===== Build context string at 0x3000 =====
; Uses r19 as output pointer, r5-r18 as scratch
build_context:
    PUSH r31
    LDI r19, 0x3000

    ; "Pos: ("
    STRO r19, "Pos: ("
    CALL advance_to_null

    ; Player X from RAM[0x7808]
    LDI r5, 0x7808
    LOAD r11, r5
    LDI r5, 0
    ADD r5, r11
    CALL write_decimal

    ; ","
    CALL advance_to_null
    STRO r19, ","
    CALL advance_to_null

    ; Player Y from RAM[0x7809]
    LDI r5, 0x7809
    LOAD r11, r5
    LDI r5, 0
    ADD r5, r11
    CALL write_decimal

    ; ") "
    CALL advance_to_null
    STRO r19, ") "
    CALL advance_to_null

    ; Check nearby building
    LDI r5, 0x7588
    LOAD r11, r5
    LDI r6, 1
    CMP r11, r6
    JNZ r12, no_nearby

    ; "Near: "
    STRO r19, "Near: "
    CALL advance_to_null

    ; Read building name: index at 0x7584
    LDI r5, 0x7584
    LOAD r13, r5        ; r13 = building index
    LDI r6, 4
    MUL r13, r6
    LDI r6, 0x7500
    ADD r13, r6         ; r13 = 0x7500 + index*4
    ADDI r13, 3          ; offset to name_addr field
    LOAD r16, r13        ; r16 = name string address
    ; Copy name chars to output
    LDI r5, 0
copy_bname:
    MOV r17, r16
    ADD r17, r5
    LOAD r11, r17
    LDI r18, 0
    CMP r11, r18
    JZ r12, ctx_done
    STORE r19, r11
    ADDI r19, 1
    ADDI r5, 1
    JMP copy_bname

no_nearby:
    STRO r19, "Explore the world!"

ctx_done:
    LDI r5, 0
    STORE r19, r5
    POP r31
    RET

; ===== Write decimal to string at r19 =====
; r5 = number to write
write_decimal:
    PUSH r31
    PUSH r5
    LDI r11, 0
    CMP r5, r11
    JNZ r12, wd_nonzero
    LDI r11, 48
    STORE r19, r11
    ADDI r19, 1
    JMP wd_done

wd_nonzero:
    LDI r6, 0x3E00     ; temp digit buffer
    LDI r13, 0          ; digit count
wd_loop:
    LDI r11, 0
    CMP r5, r11
    JZ r12, wd_reverse
    LDI r11, 10
    MOV r16, r5
    MOD r16, r11
    ADDI r16, 48
    STORE r6, r16
    ADDI r6, 1
    ADDI r13, 1
    DIV r5, r11
    JMP wd_loop

wd_reverse:
    SUBI r6, 1
wd_rev_loop:
    LDI r11, 0
    CMP r13, r11
    JZ r12, wd_done
    LOAD r16, r6
    STORE r19, r16
    ADDI r19, 1
    SUBI r6, 1
    SUBI r13, 1
    JMP wd_rev_loop

wd_done:
    LDI r5, 0
    STORE r19, r5
    POP r5
    POP r31
    RET

; ===== Advance r19 to null terminator =====
advance_to_null:
    PUSH r31
adv_loop:
    LOAD r5, r19
    LDI r11, 0
    CMP r5, r11
    JZ r12, adv_done
    ADDI r19, 1
    JMP adv_loop
adv_done:
    POP r31
    RET

; ===== Copy from r18 to r19 until null =====
copy_until_null:
    PUSH r31
cun_loop:
    LOAD r5, r18
    LDI r11, 0
    CMP r5, r11
    JZ r12, cun_done
    STORE r19, r5
    ADDI r18, 1
    ADDI r19, 1
    JMP cun_loop
cun_done:
    LDI r5, 0
    STORE r19, r5
    POP r31
    RET

; ===== Find null terminator at r5 =====
find_null:
    PUSH r31
fn_loop:
    LOAD r16, r5
    LDI r11, 0
    CMP r16, r11
    JZ r12, fn_done
    ADDI r5, 1
    JMP fn_loop
fn_done:
    POP r31
    RET

; ===== Clear buffer: r5=start, r16=count =====
clear_buf:
    PUSH r31
    PUSH r5
    PUSH r16
    LDI r11, 0
cb_loop:
    JZ r16, cb_done
    STORE r5, r11
    ADDI r5, 1
    SUBI r16, 1
    JMP cb_loop
cb_done:
    POP r16
    POP r5
    POP r31
    RET

; ===== Draw response text =====
; r11 = start x, r6 = start y
; Delegates to TEXT opcode, which wraps at column ~250 and handles \n.
draw_response:
    PUSH r31
    PUSH r5
    LDI r5, 0x3300     ; response buffer
    TEXT r11, r6, r5
    POP r5
    POP r31
    RET

done:
    HALT
