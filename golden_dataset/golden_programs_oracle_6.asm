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
;   r0: CMP result (reserved)
;   r11: Key input
;   r12: Prompt addr (0x3900)
;   r15: Response addr (0x3300)
;   r13: Max response length (768)
;   r3: Constant 1
;   r9: Constant 9 (Tab)
;   r1: Constant 10 (Enter)
;   r10: Constant 8 (Backspace)
;   r5: Constant 27 (Escape)
;   r14-r20: scratch

; ===== Initialize =====
LDI r12, 0x3900          ; full prompt addr
LDI r15, 0x3300          ; response buffer
LDI r13, 768             ; max response length
LDI r3, 1
LDI r9, 9               ; Tab
LDI r1, 10              ; Enter
LDI r10, 8              ; Backspace
LDI r5, 27             ; Escape

; Build map context prefix
CALL build_context

; Clear user input and response
LDI r14, 0x3100
LDI r16, 256
CALL clear_buf
LDI r14, 0x3300
LDI r16, 768
CALL clear_buf

; Status
LDI r14, 0x3700
STRO r14, "Tab=Ask  Esc=Exit  Enter=Clear"

; ===== Main Loop =====
main_loop:
    FILL r0

    ; -- Title bar --
    LDI r14, 0x1A0033   ; dark purple
    LDI r7, 0
    LDI r6, 0
    LDI r2, 256
    LDI r16, 14
    RECTF r7, r6, r2, r16, r14

    LDI r14, 0x3800
    STRO r14, "Oracle - AI Guide"
    LDI r7, 4
    LDI r6, 3
    LDI r2, 0x3800
    TEXT r7, r6, r2

    ; -- Context info line --
    LDI r7, 4
    LDI r6, 16
    LDI r2, 0x3000
    TEXT r7, r6, r2

    ; -- Separator --
    LDI r14, 0x333344
    LDI r7, 0
    LDI r6, 28
    LDI r2, 256
    LDI r16, 1
    RECTF r7, r6, r2, r16, r14

    ; -- User input --
    LDI r7, 4
    LDI r6, 32
    LDI r2, 0x3100
    TEXT r7, r6, r2

    ; -- Response area --
    LDI r7, 4
    LDI r6, 48
    CALL draw_response

    ; -- Status bar --
    LDI r14, 0x111122
    LDI r7, 0
    LDI r6, 248
    LDI r2, 256
    LDI r16, 8
    RECTF r7, r6, r2, r16, r14
    LDI r7, 4
    LDI r6, 248
    LDI r14, 0x3700
    TEXT r7, r6, r14

    ; -- Input --
    IKEY r11
    LDI r14, 0
    ADD r14, r11
    JZ r14, ml_continue

    CMP r11, r5
    JZ r0, done
    CMP r11, r9
    JZ r0, send_to_llm
    CMP r11, r1
    JZ r0, handle_enter
    CMP r11, r10
    JZ r0, handle_backspace

    ; Regular char: append to input buffer
    LDI r14, 0x3100
    CALL find_null
    LDI r7, 0x32FF
    CMP r14, r7
    BGE r0, ml_continue
    STORE r14, r11

ml_continue:
    FRAME
    JMP main_loop

; ===== Send to LLM =====
send_to_llm:
    ; Status: thinking
    LDI r14, 0x3700
    STRO r14, "Thinking..."

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
    LDI r14, 10
    STORE r19, r14
    ADDI r19, 1
    STORE r19, r14
    ADDI r19, 1
    STRO r19, "Question: "
    CALL advance_to_null

    ; Step 3: copy user input
    LDI r18, 0x3100
    CALL copy_until_null

    ; Step 4: append \n\nAnswer concisely.
    SUBI r19, 1
    LDI r14, 10
    STORE r19, r14
    ADDI r19, 1
    STORE r19, r14
    ADDI r19, 1
    STRO r19, "Answer concisely."
    CALL advance_to_null

    ; Call LLM: reads from 0x3900, writes to 0x3300
    LDI r12, 0x3900
    LLM r12, r15, r13

    ; Clear input
    LDI r14, 0x3100
    LDI r16, 256
    CALL clear_buf

    ; Restore status
    LDI r14, 0x3700
    STRO r14, "Tab=Ask  Esc=Exit  Enter=Clear"

    JMP ml_continue

; ===== Handle Enter: clear input + response =====
handle_enter:
    LDI r14, 0x3100
    LDI r16, 256
    CALL clear_buf
    LDI r14, 0x3300
    LDI r16, 768
    CALL clear_buf
    JMP ml_continue

; ===== Handle Backspace =====
handle_backspace:
    LDI r14, 0x3100
    CALL find_null
    LDI r7, 0x3100
    CMP r14, r7
    JZ r0, ml_continue
    SUBI r14, 1
    LDI r7, 0
    STORE r14, r7
    JMP ml_continue

; ===== Build context string at 0x3000 =====
; Uses r19 as output pointer, r14-r18 as scratch
build_context:
    PUSH r31
    LDI r19, 0x3000

    ; "Pos: ("
    STRO r19, "Pos: ("
    CALL advance_to_null

    ; Player X from RAM[0x7808]
    LDI r14, 0x7808
    LOAD r7, r14
    LDI r14, 0
    ADD r14, r7
    CALL write_decimal

    ; ","
    CALL advance_to_null
    STRO r19, ","
    CALL advance_to_null

    ; Player Y from RAM[0x7809]
    LDI r14, 0x7809
    LOAD r7, r14
    LDI r14, 0
    ADD r14, r7
    CALL write_decimal

    ; ") "
    CALL advance_to_null
    STRO r19, ") "
    CALL advance_to_null

    ; Check nearby building
    LDI r14, 0x7588
    LOAD r7, r14
    LDI r6, 1
    CMP r7, r6
    JNZ r0, no_nearby

    ; "Near: "
    STRO r19, "Near: "
    CALL advance_to_null

    ; Read building name: index at 0x7584
    LDI r14, 0x7584
    LOAD r2, r14        ; r2 = building index
    LDI r6, 4
    MUL r2, r6
    LDI r6, 0x7500
    ADD r2, r6         ; r2 = 0x7500 + index*4
    ADDI r2, 3          ; offset to name_addr field
    LOAD r16, r2        ; r16 = name string address
    ; Copy name chars to output
    LDI r14, 0
copy_bname:
    MOV r17, r16
    ADD r17, r14
    LOAD r7, r17
    LDI r18, 0
    CMP r7, r18
    JZ r0, ctx_done
    STORE r19, r7
    ADDI r19, 1
    ADDI r14, 1
    JMP copy_bname

no_nearby:
    STRO r19, "Explore the world!"

ctx_done:
    LDI r14, 0
    STORE r19, r14
    POP r31
    RET

; ===== Write decimal to string at r19 =====
; r14 = number to write
write_decimal:
    PUSH r31
    PUSH r14
    LDI r7, 0
    CMP r14, r7
    JNZ r0, wd_nonzero
    LDI r7, 48
    STORE r19, r7
    ADDI r19, 1
    JMP wd_done

wd_nonzero:
    LDI r6, 0x3E00     ; temp digit buffer
    LDI r2, 0          ; digit count
wd_loop:
    LDI r7, 0
    CMP r14, r7
    JZ r0, wd_reverse
    LDI r7, 10
    MOV r16, r14
    MOD r16, r7
    ADDI r16, 48
    STORE r6, r16
    ADDI r6, 1
    ADDI r2, 1
    DIV r14, r7
    JMP wd_loop

wd_reverse:
    SUBI r6, 1
wd_rev_loop:
    LDI r7, 0
    CMP r2, r7
    JZ r0, wd_done
    LOAD r16, r6
    STORE r19, r16
    ADDI r19, 1
    SUBI r6, 1
    SUBI r2, 1
    JMP wd_rev_loop

wd_done:
    LDI r14, 0
    STORE r19, r14
    POP r14
    POP r31
    RET

; ===== Advance r19 to null terminator =====
advance_to_null:
    PUSH r31
adv_loop:
    LOAD r14, r19
    LDI r7, 0
    CMP r14, r7
    JZ r0, adv_done
    ADDI r19, 1
    JMP adv_loop
adv_done:
    POP r31
    RET

; ===== Copy from r18 to r19 until null =====
copy_until_null:
    PUSH r31
cun_loop:
    LOAD r14, r18
    LDI r7, 0
    CMP r14, r7
    JZ r0, cun_done
    STORE r19, r14
    ADDI r18, 1
    ADDI r19, 1
    JMP cun_loop
cun_done:
    LDI r14, 0
    STORE r19, r14
    POP r31
    RET

; ===== Find null terminator at r14 =====
find_null:
    PUSH r31
fn_loop:
    LOAD r16, r14
    LDI r7, 0
    CMP r16, r7
    JZ r0, fn_done
    ADDI r14, 1
    JMP fn_loop
fn_done:
    POP r31
    RET

; ===== Clear buffer: r14=start, r16=count =====
clear_buf:
    PUSH r31
    PUSH r14
    PUSH r16
    LDI r7, 0
cb_loop:
    JZ r16, cb_done
    STORE r14, r7
    ADDI r14, 1
    SUBI r16, 1
    JMP cb_loop
cb_done:
    POP r16
    POP r14
    POP r31
    RET

; ===== Draw response text =====
; r7 = start x, r6 = start y
; Delegates to TEXT opcode, which wraps at column ~250 and handles \n.
draw_response:
    PUSH r31
    PUSH r14
    LDI r14, 0x3300     ; response buffer
    TEXT r7, r6, r14
    POP r14
    POP r31
    RET

done:
    HALT
