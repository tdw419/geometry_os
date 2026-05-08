; DESCRIPTION: This GeOS assembly code implements an interactive AI Oracle system where users can ask questions about the world. The LLM opcode is used to send map-aware prompts to an external AI, which responds with concise answers displayed on the screen. The code manages memory buffers for context, user input, and responses, handles user input through a main loop, and processes key presses for asking questions, clearing input, and exiting.

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
;   r2: CMP result (reserved)
;   r13: Key input
;   r0: Prompt addr (0x3900)
;   r1: Response addr (0x3300)
;   r8: Max response length (768)
;   r12: Constant 1
;   r6: Constant 9 (Tab)
;   r14: Constant 10 (Enter)
;   r5: Constant 8 (Backspace)
;   r11: Constant 27 (Escape)
;   r10-r20: scratch

; ===== Initialize =====
LDI r0, 0x3900          ; full prompt addr
LDI r1, 0x3300          ; response buffer
LDI r8, 768             ; max response length
LDI r12, 1
LDI r6, 9               ; Tab
LDI r14, 10              ; Enter
LDI r5, 8              ; Backspace
LDI r11, 27             ; Escape

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
    FILL r2

    ; -- Title bar --
    LDI r10, 0x1A0033   ; dark purple
    LDI r7, 0
    LDI r3, 0
    LDI r9, 256
    LDI r16, 14
    RECTF r7, r3, r9, r16, r10

    LDI r10, 0x3800
    STRO r10, "Oracle - AI Guide"
    LDI r7, 4
    LDI r3, 3
    LDI r9, 0x3800
    TEXT r7, r3, r9

    ; -- Context info line --
    LDI r7, 4
    LDI r3, 16
    LDI r9, 0x3000
    TEXT r7, r3, r9

    ; -- Separator --
    LDI r10, 0x333344
    LDI r7, 0
    LDI r3, 28
    LDI r9, 256
    LDI r16, 1
    RECTF r7, r3, r9, r16, r10

    ; -- User input --
    LDI r7, 4
    LDI r3, 32
    LDI r9, 0x3100
    TEXT r7, r3, r9

    ; -- Response area --
    LDI r7, 4
    LDI r3, 48
    CALL draw_response

    ; -- Status bar --
    LDI r10, 0x111122
    LDI r7, 0
    LDI r3, 248
    LDI r9, 256
    LDI r16, 8
    RECTF r7, r3, r9, r16, r10
    LDI r7, 4
    LDI r3, 248
    LDI r10, 0x3700
    TEXT r7, r3, r10

    ; -- Input --
    IKEY r13
    LDI r10, 0
    ADD r10, r13
    JZ r10, ml_continue

    CMP r13, r11
    JZ r2, done
    CMP r13, r6
    JZ r2, send_to_llm
    CMP r13, r14
    JZ r2, handle_enter
    CMP r13, r5
    JZ r2, handle_backspace

    ; Regular char: append to input buffer
    LDI r10, 0x3100
    CALL find_null
    LDI r7, 0x32FF
    CMP r10, r7
    BGE r2, ml_continue
    STORE r10, r13

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
    LDI r0, 0x3900
    LLM r0, r1, r8

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
    LDI r7, 0x3100
    CMP r10, r7
    JZ r2, ml_continue
    SUBI r10, 1
    LDI r7, 0
    STORE r10, r7
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
    LOAD r7, r10
    LDI r10, 0
    ADD r10, r7
    CALL write_decimal

    ; ","
    CALL advance_to_null
    STRO r19, ","
    CALL advance_to_null

    ; Player Y from RAM[0x7809]
    LDI r10, 0x7809
    LOAD r7, r10
    LDI r10, 0
    ADD r10, r7
    CALL write_decimal

    ; ") "
    CALL advance_to_null
    STRO r19, ") "
    CALL advance_to_null

    ; Check nearby building
    LDI r10, 0x7588
    LOAD r7, r10
    LDI r3, 1
    CMP r7, r3
    JNZ r2, no_nearby

    ; "Near: "
    STRO r19, "Near: "
    CALL advance_to_null

    ; Read building name: index at 0x7584
    LDI r10, 0x7584
    LOAD r9, r10        ; r9 = building index
    LDI r3, 4
    MUL r9, r3
    LDI r3, 0x7500
    ADD r9, r3         ; r9 = 0x7500 + index*4
    ADDI r9, 3          ; offset to name_addr field
    LOAD r16, r9        ; r16 = name string address
    ; Copy name chars to output
    LDI r10, 0
copy_bname:
    MOV r17, r16
    ADD r17, r10
    LOAD r7, r17
    LDI r18, 0
    CMP r7, r18
    JZ r2, ctx_done
    STORE r19, r7
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
    LDI r7, 0
    CMP r10, r7
    JNZ r2, wd_nonzero
    LDI r7, 48
    STORE r19, r7
    ADDI r19, 1
    JMP wd_done

wd_nonzero:
    LDI r3, 0x3E00     ; temp digit buffer
    LDI r9, 0          ; digit count
wd_loop:
    LDI r7, 0
    CMP r10, r7
    JZ r2, wd_reverse
    LDI r7, 10
    MOV r16, r10
    MOD r16, r7
    ADDI r16, 48
    STORE r3, r16
    ADDI r3, 1
    ADDI r9, 1
    DIV r10, r7
    JMP wd_loop

wd_reverse:
    SUBI r3, 1
wd_rev_loop:
    LDI r7, 0
    CMP r9, r7
    JZ r2, wd_done
    LOAD r16, r3
    STORE r19, r16
    ADDI r19, 1
    SUBI r3, 1
    SUBI r9, 1
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
    LDI r7, 0
    CMP r10, r7
    JZ r2, adv_done
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
    LDI r7, 0
    CMP r10, r7
    JZ r2, cun_done
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
    LDI r7, 0
    CMP r16, r7
    JZ r2, fn_done
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
    LDI r7, 0
cb_loop:
    JZ r16, cb_done
    STORE r10, r7
    ADDI r10, 1
    SUBI r16, 1
    JMP cb_loop
cb_done:
    POP r16
    POP r10
    POP r31
    RET

; ===== Draw response text =====
; r7 = start x, r3 = start y
; Delegates to TEXT opcode, which wraps at column ~250 and handles \n.
draw_response:
    PUSH r31
    PUSH r10
    LDI r10, 0x3300     ; response buffer
    TEXT r7, r3, r10
    POP r10
    POP r31
    RET

done:
    HALT
