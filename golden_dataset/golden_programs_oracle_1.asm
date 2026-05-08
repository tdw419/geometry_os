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
;   r6: CMP result (reserved)
;   r12: Key input
;   r10: Prompt addr (0x3900)
;   r4: Response addr (0x3300)
;   r9: Max response length (768)
;   r3: Constant 1
;   r13: Constant 9 (Tab)
;   r7: Constant 10 (Enter)
;   r5: Constant 8 (Backspace)
;   r8: Constant 27 (Escape)
;   r0-r20: scratch

; ===== Initialize =====
LDI r10, 0x3900          ; full prompt addr
LDI r4, 0x3300          ; response buffer
LDI r9, 768             ; max response length
LDI r3, 1
LDI r13, 9               ; Tab
LDI r7, 10              ; Enter
LDI r5, 8              ; Backspace
LDI r8, 27             ; Escape

; Build map context prefix
CALL build_context

; Clear user input and response
LDI r0, 0x3100
LDI r16, 256
CALL clear_buf
LDI r0, 0x3300
LDI r16, 768
CALL clear_buf

; Status
LDI r0, 0x3700
STRO r0, "Tab=Ask  Esc=Exit  Enter=Clear"

; ===== Main Loop =====
main_loop:
    FILL r6

    ; -- Title bar --
    LDI r0, 0x1A0033   ; dark purple
    LDI r14, 0
    LDI r1, 0
    LDI r2, 256
    LDI r16, 14
    RECTF r14, r1, r2, r16, r0

    LDI r0, 0x3800
    STRO r0, "Oracle - AI Guide"
    LDI r14, 4
    LDI r1, 3
    LDI r2, 0x3800
    TEXT r14, r1, r2

    ; -- Context info line --
    LDI r14, 4
    LDI r1, 16
    LDI r2, 0x3000
    TEXT r14, r1, r2

    ; -- Separator --
    LDI r0, 0x333344
    LDI r14, 0
    LDI r1, 28
    LDI r2, 256
    LDI r16, 1
    RECTF r14, r1, r2, r16, r0

    ; -- User input --
    LDI r14, 4
    LDI r1, 32
    LDI r2, 0x3100
    TEXT r14, r1, r2

    ; -- Response area --
    LDI r14, 4
    LDI r1, 48
    CALL draw_response

    ; -- Status bar --
    LDI r0, 0x111122
    LDI r14, 0
    LDI r1, 248
    LDI r2, 256
    LDI r16, 8
    RECTF r14, r1, r2, r16, r0
    LDI r14, 4
    LDI r1, 248
    LDI r0, 0x3700
    TEXT r14, r1, r0

    ; -- Input --
    IKEY r12
    LDI r0, 0
    ADD r0, r12
    JZ r0, ml_continue

    CMP r12, r8
    JZ r6, done
    CMP r12, r13
    JZ r6, send_to_llm
    CMP r12, r7
    JZ r6, handle_enter
    CMP r12, r5
    JZ r6, handle_backspace

    ; Regular char: append to input buffer
    LDI r0, 0x3100
    CALL find_null
    LDI r14, 0x32FF
    CMP r0, r14
    BGE r6, ml_continue
    STORE r0, r12

ml_continue:
    FRAME
    JMP main_loop

; ===== Send to LLM =====
send_to_llm:
    ; Status: thinking
    LDI r0, 0x3700
    STRO r0, "Thinking..."

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
    LDI r0, 10
    STORE r19, r0
    ADDI r19, 1
    STORE r19, r0
    ADDI r19, 1
    STRO r19, "Question: "
    CALL advance_to_null

    ; Step 3: copy user input
    LDI r18, 0x3100
    CALL copy_until_null

    ; Step 4: append \n\nAnswer concisely.
    SUBI r19, 1
    LDI r0, 10
    STORE r19, r0
    ADDI r19, 1
    STORE r19, r0
    ADDI r19, 1
    STRO r19, "Answer concisely."
    CALL advance_to_null

    ; Call LLM: reads from 0x3900, writes to 0x3300
    LDI r10, 0x3900
    LLM r10, r4, r9

    ; Clear input
    LDI r0, 0x3100
    LDI r16, 256
    CALL clear_buf

    ; Restore status
    LDI r0, 0x3700
    STRO r0, "Tab=Ask  Esc=Exit  Enter=Clear"

    JMP ml_continue

; ===== Handle Enter: clear input + response =====
handle_enter:
    LDI r0, 0x3100
    LDI r16, 256
    CALL clear_buf
    LDI r0, 0x3300
    LDI r16, 768
    CALL clear_buf
    JMP ml_continue

; ===== Handle Backspace =====
handle_backspace:
    LDI r0, 0x3100
    CALL find_null
    LDI r14, 0x3100
    CMP r0, r14
    JZ r6, ml_continue
    SUBI r0, 1
    LDI r14, 0
    STORE r0, r14
    JMP ml_continue

; ===== Build context string at 0x3000 =====
; Uses r19 as output pointer, r0-r18 as scratch
build_context:
    PUSH r31
    LDI r19, 0x3000

    ; "Pos: ("
    STRO r19, "Pos: ("
    CALL advance_to_null

    ; Player X from RAM[0x7808]
    LDI r0, 0x7808
    LOAD r14, r0
    LDI r0, 0
    ADD r0, r14
    CALL write_decimal

    ; ","
    CALL advance_to_null
    STRO r19, ","
    CALL advance_to_null

    ; Player Y from RAM[0x7809]
    LDI r0, 0x7809
    LOAD r14, r0
    LDI r0, 0
    ADD r0, r14
    CALL write_decimal

    ; ") "
    CALL advance_to_null
    STRO r19, ") "
    CALL advance_to_null

    ; Check nearby building
    LDI r0, 0x7588
    LOAD r14, r0
    LDI r1, 1
    CMP r14, r1
    JNZ r6, no_nearby

    ; "Near: "
    STRO r19, "Near: "
    CALL advance_to_null

    ; Read building name: index at 0x7584
    LDI r0, 0x7584
    LOAD r2, r0        ; r2 = building index
    LDI r1, 4
    MUL r2, r1
    LDI r1, 0x7500
    ADD r2, r1         ; r2 = 0x7500 + index*4
    ADDI r2, 3          ; offset to name_addr field
    LOAD r16, r2        ; r16 = name string address
    ; Copy name chars to output
    LDI r0, 0
copy_bname:
    MOV r17, r16
    ADD r17, r0
    LOAD r14, r17
    LDI r18, 0
    CMP r14, r18
    JZ r6, ctx_done
    STORE r19, r14
    ADDI r19, 1
    ADDI r0, 1
    JMP copy_bname

no_nearby:
    STRO r19, "Explore the world!"

ctx_done:
    LDI r0, 0
    STORE r19, r0
    POP r31
    RET

; ===== Write decimal to string at r19 =====
; r0 = number to write
write_decimal:
    PUSH r31
    PUSH r0
    LDI r14, 0
    CMP r0, r14
    JNZ r6, wd_nonzero
    LDI r14, 48
    STORE r19, r14
    ADDI r19, 1
    JMP wd_done

wd_nonzero:
    LDI r1, 0x3E00     ; temp digit buffer
    LDI r2, 0          ; digit count
wd_loop:
    LDI r14, 0
    CMP r0, r14
    JZ r6, wd_reverse
    LDI r14, 10
    MOV r16, r0
    MOD r16, r14
    ADDI r16, 48
    STORE r1, r16
    ADDI r1, 1
    ADDI r2, 1
    DIV r0, r14
    JMP wd_loop

wd_reverse:
    SUBI r1, 1
wd_rev_loop:
    LDI r14, 0
    CMP r2, r14
    JZ r6, wd_done
    LOAD r16, r1
    STORE r19, r16
    ADDI r19, 1
    SUBI r1, 1
    SUBI r2, 1
    JMP wd_rev_loop

wd_done:
    LDI r0, 0
    STORE r19, r0
    POP r0
    POP r31
    RET

; ===== Advance r19 to null terminator =====
advance_to_null:
    PUSH r31
adv_loop:
    LOAD r0, r19
    LDI r14, 0
    CMP r0, r14
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
    LOAD r0, r18
    LDI r14, 0
    CMP r0, r14
    JZ r6, cun_done
    STORE r19, r0
    ADDI r18, 1
    ADDI r19, 1
    JMP cun_loop
cun_done:
    LDI r0, 0
    STORE r19, r0
    POP r31
    RET

; ===== Find null terminator at r0 =====
find_null:
    PUSH r31
fn_loop:
    LOAD r16, r0
    LDI r14, 0
    CMP r16, r14
    JZ r6, fn_done
    ADDI r0, 1
    JMP fn_loop
fn_done:
    POP r31
    RET

; ===== Clear buffer: r0=start, r16=count =====
clear_buf:
    PUSH r31
    PUSH r0
    PUSH r16
    LDI r14, 0
cb_loop:
    JZ r16, cb_done
    STORE r0, r14
    ADDI r0, 1
    SUBI r16, 1
    JMP cb_loop
cb_done:
    POP r16
    POP r0
    POP r31
    RET

; ===== Draw response text =====
; r14 = start x, r1 = start y
; Delegates to TEXT opcode, which wraps at column ~250 and handles \n.
draw_response:
    PUSH r31
    PUSH r0
    LDI r0, 0x3300     ; response buffer
    TEXT r14, r1, r0
    POP r0
    POP r31
    RET

done:
    HALT
