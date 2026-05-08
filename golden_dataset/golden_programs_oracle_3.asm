; DESCRIPTION: A colored object centered at the screen with fixed size.

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
;   r13: Key input
;   r14: Prompt addr (0x3900)
;   r4: Response addr (0x3300)
;   r1: Max response length (768)
;   r6: Constant 1
;   r8: Constant 9 (Tab)
;   r5: Constant 10 (Enter)
;   r10: Constant 8 (Backspace)
;   r3: Constant 27 (Escape)
;   r9-r20: scratch

; ===== Initialize =====
LDI r14, 0x3900          ; full prompt addr
LDI r4, 0x3300          ; response buffer
LDI r1, 768             ; max response length
LDI r6, 1
LDI r8, 9               ; Tab
LDI r5, 10              ; Enter
LDI r10, 8              ; Backspace
LDI r3, 27             ; Escape

; Build map context prefix
CALL build_context

; Clear user input and response
LDI r9, 0x3100
LDI r16, 256
CALL clear_buf
LDI r9, 0x3300
LDI r16, 768
CALL clear_buf

; Status
LDI r9, 0x3700
STRO r9, "Tab=Ask  Esc=Exit  Enter=Clear"

; ===== Main Loop =====
main_loop:
    FILL r0

    ; -- Title bar --
    LDI r9, 0x1A0033   ; dark purple
    LDI r15, 0
    LDI r12, 0
    LDI r2, 256
    LDI r16, 14
    RECTF r15, r12, r2, r16, r9

    LDI r9, 0x3800
    STRO r9, "Oracle - AI Guide"
    LDI r15, 4
    LDI r12, 3
    LDI r2, 0x3800
    TEXT r15, r12, r2

    ; -- Context info line --
    LDI r15, 4
    LDI r12, 16
    LDI r2, 0x3000
    TEXT r15, r12, r2

    ; -- Separator --
    LDI r9, 0x333344
    LDI r15, 0
    LDI r12, 28
    LDI r2, 256
    LDI r16, 1
    RECTF r15, r12, r2, r16, r9

    ; -- User input --
    LDI r15, 4
    LDI r12, 32
    LDI r2, 0x3100
    TEXT r15, r12, r2

    ; -- Response area --
    LDI r15, 4
    LDI r12, 48
    CALL draw_response

    ; -- Status bar --
    LDI r9, 0x111122
    LDI r15, 0
    LDI r12, 248
    LDI r2, 256
    LDI r16, 8
    RECTF r15, r12, r2, r16, r9
    LDI r15, 4
    LDI r12, 248
    LDI r9, 0x3700
    TEXT r15, r12, r9

    ; -- Input --
    IKEY r13
    LDI r9, 0
    ADD r9, r13
    JZ r9, ml_continue

    CMP r13, r3
    JZ r0, done
    CMP r13, r8
    JZ r0, send_to_llm
    CMP r13, r5
    JZ r0, handle_enter
    CMP r13, r10
    JZ r0, handle_backspace

    ; Regular char: append to input buffer
    LDI r9, 0x3100
    CALL find_null
    LDI r15, 0x32FF
    CMP r9, r15
    BGE r0, ml_continue
    STORE r9, r13

ml_continue:
    FRAME
    JMP main_loop

; ===== Send to LLM =====
send_to_llm:
    ; Status: thinking
    LDI r9, 0x3700
    STRO r9, "Thinking..."

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
    LDI r9, 10
    STORE r19, r9
    ADDI r19, 1
    STORE r19, r9
    ADDI r19, 1
    STRO r19, "Question: "
    CALL advance_to_null

    ; Step 3: copy user input
    LDI r18, 0x3100
    CALL copy_until_null

    ; Step 4: append \n\nAnswer concisely.
    SUBI r19, 1
    LDI r9, 10
    STORE r19, r9
    ADDI r19, 1
    STORE r19, r9
    ADDI r19, 1
    STRO r19, "Answer concisely."
    CALL advance_to_null

    ; Call LLM: reads from 0x3900, writes to 0x3300
    LDI r14, 0x3900
    LLM r14, r4, r1

    ; Clear input
    LDI r9, 0x3100
    LDI r16, 256
    CALL clear_buf

    ; Restore status
    LDI r9, 0x3700
    STRO r9, "Tab=Ask  Esc=Exit  Enter=Clear"

    JMP ml_continue

; ===== Handle Enter: clear input + response =====
handle_enter:
    LDI r9, 0x3100
    LDI r16, 256
    CALL clear_buf
    LDI r9, 0x3300
    LDI r16, 768
    CALL clear_buf
    JMP ml_continue

; ===== Handle Backspace =====
handle_backspace:
    LDI r9, 0x3100
    CALL find_null
    LDI r15, 0x3100
    CMP r9, r15
    JZ r0, ml_continue
    SUBI r9, 1
    LDI r15, 0
    STORE r9, r15
    JMP ml_continue

; ===== Build context string at 0x3000 =====
; Uses r19 as output pointer, r9-r18 as scratch
build_context:
    PUSH r31
    LDI r19, 0x3000

    ; "Pos: ("
    STRO r19, "Pos: ("
    CALL advance_to_null

    ; Player X from RAM[0x7808]
    LDI r9, 0x7808
    LOAD r15, r9
    LDI r9, 0
    ADD r9, r15
    CALL write_decimal

    ; ","
    CALL advance_to_null
    STRO r19, ","
    CALL advance_to_null

    ; Player Y from RAM[0x7809]
    LDI r9, 0x7809
    LOAD r15, r9
    LDI r9, 0
    ADD r9, r15
    CALL write_decimal

    ; ") "
    CALL advance_to_null
    STRO r19, ") "
    CALL advance_to_null

    ; Check nearby building
    LDI r9, 0x7588
    LOAD r15, r9
    LDI r12, 1
    CMP r15, r12
    JNZ r0, no_nearby

    ; "Near: "
    STRO r19, "Near: "
    CALL advance_to_null

    ; Read building name: index at 0x7584
    LDI r9, 0x7584
    LOAD r2, r9        ; r2 = building index
    LDI r12, 4
    MUL r2, r12
    LDI r12, 0x7500
    ADD r2, r12         ; r2 = 0x7500 + index*4
    ADDI r2, 3          ; offset to name_addr field
    LOAD r16, r2        ; r16 = name string address
    ; Copy name chars to output
    LDI r9, 0
copy_bname:
    MOV r17, r16
    ADD r17, r9
    LOAD r15, r17
    LDI r18, 0
    CMP r15, r18
    JZ r0, ctx_done
    STORE r19, r15
    ADDI r19, 1
    ADDI r9, 1
    JMP copy_bname

no_nearby:
    STRO r19, "Explore the world!"

ctx_done:
    LDI r9, 0
    STORE r19, r9
    POP r31
    RET

; ===== Write decimal to string at r19 =====
; r9 = number to write
write_decimal:
    PUSH r31
    PUSH r9
    LDI r15, 0
    CMP r9, r15
    JNZ r0, wd_nonzero
    LDI r15, 48
    STORE r19, r15
    ADDI r19, 1
    JMP wd_done

wd_nonzero:
    LDI r12, 0x3E00     ; temp digit buffer
    LDI r2, 0          ; digit count
wd_loop:
    LDI r15, 0
    CMP r9, r15
    JZ r0, wd_reverse
    LDI r15, 10
    MOV r16, r9
    MOD r16, r15
    ADDI r16, 48
    STORE r12, r16
    ADDI r12, 1
    ADDI r2, 1
    DIV r9, r15
    JMP wd_loop

wd_reverse:
    SUBI r12, 1
wd_rev_loop:
    LDI r15, 0
    CMP r2, r15
    JZ r0, wd_done
    LOAD r16, r12
    STORE r19, r16
    ADDI r19, 1
    SUBI r12, 1
    SUBI r2, 1
    JMP wd_rev_loop

wd_done:
    LDI r9, 0
    STORE r19, r9
    POP r9
    POP r31
    RET

; ===== Advance r19 to null terminator =====
advance_to_null:
    PUSH r31
adv_loop:
    LOAD r9, r19
    LDI r15, 0
    CMP r9, r15
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
    LOAD r9, r18
    LDI r15, 0
    CMP r9, r15
    JZ r0, cun_done
    STORE r19, r9
    ADDI r18, 1
    ADDI r19, 1
    JMP cun_loop
cun_done:
    LDI r9, 0
    STORE r19, r9
    POP r31
    RET

; ===== Find null terminator at r9 =====
find_null:
    PUSH r31
fn_loop:
    LOAD r16, r9
    LDI r15, 0
    CMP r16, r15
    JZ r0, fn_done
    ADDI r9, 1
    JMP fn_loop
fn_done:
    POP r31
    RET

; ===== Clear buffer: r9=start, r16=count =====
clear_buf:
    PUSH r31
    PUSH r9
    PUSH r16
    LDI r15, 0
cb_loop:
    JZ r16, cb_done
    STORE r9, r15
    ADDI r9, 1
    SUBI r16, 1
    JMP cb_loop
cb_done:
    POP r16
    POP r9
    POP r31
    RET

; ===== Draw response text =====
; r15 = start x, r12 = start y
; Delegates to TEXT opcode, which wraps at column ~250 and handles \n.
draw_response:
    PUSH r31
    PUSH r9
    LDI r9, 0x3300     ; response buffer
    TEXT r15, r12, r9
    POP r9
    POP r31
    RET

done:
    HALT
