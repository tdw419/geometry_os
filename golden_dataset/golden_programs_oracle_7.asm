; DESCRIPTION: Display a object using color colored at the screen.

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
;   r13: CMP result (reserved)
;   r5: Key input
;   r14: Prompt addr (0x3900)
;   r11: Response addr (0x3300)
;   r4: Max response length (768)
;   r1: Constant 1
;   r6: Constant 9 (Tab)
;   r12: Constant 10 (Enter)
;   r2: Constant 8 (Backspace)
;   r15: Constant 27 (Escape)
;   r8-r20: scratch

; ===== Initialize =====
LDI r14, 0x3900          ; full prompt addr
LDI r11, 0x3300          ; response buffer
LDI r4, 768             ; max response length
LDI r1, 1
LDI r6, 9               ; Tab
LDI r12, 10              ; Enter
LDI r2, 8              ; Backspace
LDI r15, 27             ; Escape

; Build map context prefix
CALL build_context

; Clear user input and response
LDI r8, 0x3100
LDI r16, 256
CALL clear_buf
LDI r8, 0x3300
LDI r16, 768
CALL clear_buf

; Status
LDI r8, 0x3700
STRO r8, "Tab=Ask  Esc=Exit  Enter=Clear"

; ===== Main Loop =====
main_loop:
    FILL r13

    ; -- Title bar --
    LDI r8, 0x1A0033   ; dark purple
    LDI r3, 0
    LDI r7, 0
    LDI r10, 256
    LDI r16, 14
    RECTF r3, r7, r10, r16, r8

    LDI r8, 0x3800
    STRO r8, "Oracle - AI Guide"
    LDI r3, 4
    LDI r7, 3
    LDI r10, 0x3800
    TEXT r3, r7, r10

    ; -- Context info line --
    LDI r3, 4
    LDI r7, 16
    LDI r10, 0x3000
    TEXT r3, r7, r10

    ; -- Separator --
    LDI r8, 0x333344
    LDI r3, 0
    LDI r7, 28
    LDI r10, 256
    LDI r16, 1
    RECTF r3, r7, r10, r16, r8

    ; -- User input --
    LDI r3, 4
    LDI r7, 32
    LDI r10, 0x3100
    TEXT r3, r7, r10

    ; -- Response area --
    LDI r3, 4
    LDI r7, 48
    CALL draw_response

    ; -- Status bar --
    LDI r8, 0x111122
    LDI r3, 0
    LDI r7, 248
    LDI r10, 256
    LDI r16, 8
    RECTF r3, r7, r10, r16, r8
    LDI r3, 4
    LDI r7, 248
    LDI r8, 0x3700
    TEXT r3, r7, r8

    ; -- Input --
    IKEY r5
    LDI r8, 0
    ADD r8, r5
    JZ r8, ml_continue

    CMP r5, r15
    JZ r13, done
    CMP r5, r6
    JZ r13, send_to_llm
    CMP r5, r12
    JZ r13, handle_enter
    CMP r5, r2
    JZ r13, handle_backspace

    ; Regular char: append to input buffer
    LDI r8, 0x3100
    CALL find_null
    LDI r3, 0x32FF
    CMP r8, r3
    BGE r13, ml_continue
    STORE r8, r5

ml_continue:
    FRAME
    JMP main_loop

; ===== Send to LLM =====
send_to_llm:
    ; Status: thinking
    LDI r8, 0x3700
    STRO r8, "Thinking..."

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
    LDI r8, 10
    STORE r19, r8
    ADDI r19, 1
    STORE r19, r8
    ADDI r19, 1
    STRO r19, "Question: "
    CALL advance_to_null

    ; Step 3: copy user input
    LDI r18, 0x3100
    CALL copy_until_null

    ; Step 4: append \n\nAnswer concisely.
    SUBI r19, 1
    LDI r8, 10
    STORE r19, r8
    ADDI r19, 1
    STORE r19, r8
    ADDI r19, 1
    STRO r19, "Answer concisely."
    CALL advance_to_null

    ; Call LLM: reads from 0x3900, writes to 0x3300
    LDI r14, 0x3900
    LLM r14, r11, r4

    ; Clear input
    LDI r8, 0x3100
    LDI r16, 256
    CALL clear_buf

    ; Restore status
    LDI r8, 0x3700
    STRO r8, "Tab=Ask  Esc=Exit  Enter=Clear"

    JMP ml_continue

; ===== Handle Enter: clear input + response =====
handle_enter:
    LDI r8, 0x3100
    LDI r16, 256
    CALL clear_buf
    LDI r8, 0x3300
    LDI r16, 768
    CALL clear_buf
    JMP ml_continue

; ===== Handle Backspace =====
handle_backspace:
    LDI r8, 0x3100
    CALL find_null
    LDI r3, 0x3100
    CMP r8, r3
    JZ r13, ml_continue
    SUBI r8, 1
    LDI r3, 0
    STORE r8, r3
    JMP ml_continue

; ===== Build context string at 0x3000 =====
; Uses r19 as output pointer, r8-r18 as scratch
build_context:
    PUSH r31
    LDI r19, 0x3000

    ; "Pos: ("
    STRO r19, "Pos: ("
    CALL advance_to_null

    ; Player X from RAM[0x7808]
    LDI r8, 0x7808
    LOAD r3, r8
    LDI r8, 0
    ADD r8, r3
    CALL write_decimal

    ; ","
    CALL advance_to_null
    STRO r19, ","
    CALL advance_to_null

    ; Player Y from RAM[0x7809]
    LDI r8, 0x7809
    LOAD r3, r8
    LDI r8, 0
    ADD r8, r3
    CALL write_decimal

    ; ") "
    CALL advance_to_null
    STRO r19, ") "
    CALL advance_to_null

    ; Check nearby building
    LDI r8, 0x7588
    LOAD r3, r8
    LDI r7, 1
    CMP r3, r7
    JNZ r13, no_nearby

    ; "Near: "
    STRO r19, "Near: "
    CALL advance_to_null

    ; Read building name: index at 0x7584
    LDI r8, 0x7584
    LOAD r10, r8        ; r10 = building index
    LDI r7, 4
    MUL r10, r7
    LDI r7, 0x7500
    ADD r10, r7         ; r10 = 0x7500 + index*4
    ADDI r10, 3          ; offset to name_addr field
    LOAD r16, r10        ; r16 = name string address
    ; Copy name chars to output
    LDI r8, 0
copy_bname:
    MOV r17, r16
    ADD r17, r8
    LOAD r3, r17
    LDI r18, 0
    CMP r3, r18
    JZ r13, ctx_done
    STORE r19, r3
    ADDI r19, 1
    ADDI r8, 1
    JMP copy_bname

no_nearby:
    STRO r19, "Explore the world!"

ctx_done:
    LDI r8, 0
    STORE r19, r8
    POP r31
    RET

; ===== Write decimal to string at r19 =====
; r8 = number to write
write_decimal:
    PUSH r31
    PUSH r8
    LDI r3, 0
    CMP r8, r3
    JNZ r13, wd_nonzero
    LDI r3, 48
    STORE r19, r3
    ADDI r19, 1
    JMP wd_done

wd_nonzero:
    LDI r7, 0x3E00     ; temp digit buffer
    LDI r10, 0          ; digit count
wd_loop:
    LDI r3, 0
    CMP r8, r3
    JZ r13, wd_reverse
    LDI r3, 10
    MOV r16, r8
    MOD r16, r3
    ADDI r16, 48
    STORE r7, r16
    ADDI r7, 1
    ADDI r10, 1
    DIV r8, r3
    JMP wd_loop

wd_reverse:
    SUBI r7, 1
wd_rev_loop:
    LDI r3, 0
    CMP r10, r3
    JZ r13, wd_done
    LOAD r16, r7
    STORE r19, r16
    ADDI r19, 1
    SUBI r7, 1
    SUBI r10, 1
    JMP wd_rev_loop

wd_done:
    LDI r8, 0
    STORE r19, r8
    POP r8
    POP r31
    RET

; ===== Advance r19 to null terminator =====
advance_to_null:
    PUSH r31
adv_loop:
    LOAD r8, r19
    LDI r3, 0
    CMP r8, r3
    JZ r13, adv_done
    ADDI r19, 1
    JMP adv_loop
adv_done:
    POP r31
    RET

; ===== Copy from r18 to r19 until null =====
copy_until_null:
    PUSH r31
cun_loop:
    LOAD r8, r18
    LDI r3, 0
    CMP r8, r3
    JZ r13, cun_done
    STORE r19, r8
    ADDI r18, 1
    ADDI r19, 1
    JMP cun_loop
cun_done:
    LDI r8, 0
    STORE r19, r8
    POP r31
    RET

; ===== Find null terminator at r8 =====
find_null:
    PUSH r31
fn_loop:
    LOAD r16, r8
    LDI r3, 0
    CMP r16, r3
    JZ r13, fn_done
    ADDI r8, 1
    JMP fn_loop
fn_done:
    POP r31
    RET

; ===== Clear buffer: r8=start, r16=count =====
clear_buf:
    PUSH r31
    PUSH r8
    PUSH r16
    LDI r3, 0
cb_loop:
    JZ r16, cb_done
    STORE r8, r3
    ADDI r8, 1
    SUBI r16, 1
    JMP cb_loop
cb_done:
    POP r16
    POP r8
    POP r31
    RET

; ===== Draw response text =====
; r3 = start x, r7 = start y
; Delegates to TEXT opcode, which wraps at column ~250 and handles \n.
draw_response:
    PUSH r31
    PUSH r8
    LDI r8, 0x3300     ; response buffer
    TEXT r3, r7, r8
    POP r8
    POP r31
    RET

done:
    HALT
