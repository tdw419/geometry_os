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
;   r7: CMP result (reserved)
;   r9: Key input
;   r13: Prompt addr (0x3900)
;   r2: Response addr (0x3300)
;   r8: Max response length (768)
;   r1: Constant 1
;   r3: Constant 9 (Tab)
;   r14: Constant 10 (Enter)
;   r11: Constant 8 (Backspace)
;   r15: Constant 27 (Escape)
;   r12-r20: scratch

; ===== Initialize =====
LDI r13, 0x3900          ; full prompt addr
LDI r2, 0x3300          ; response buffer
LDI r8, 768             ; max response length
LDI r1, 1
LDI r3, 9               ; Tab
LDI r14, 10              ; Enter
LDI r11, 8              ; Backspace
LDI r15, 27             ; Escape

; Build map context prefix
CALL build_context

; Clear user input and response
LDI r12, 0x3100
LDI r16, 256
CALL clear_buf
LDI r12, 0x3300
LDI r16, 768
CALL clear_buf

; Status
LDI r12, 0x3700
STRO r12, "Tab=Ask  Esc=Exit  Enter=Clear"

; ===== Main Loop =====
main_loop:
    FILL r7

    ; -- Title bar --
    LDI r12, 0x1A0033   ; dark purple
    LDI r4, 0
    LDI r0, 0
    LDI r6, 256
    LDI r16, 14
    RECTF r4, r0, r6, r16, r12

    LDI r12, 0x3800
    STRO r12, "Oracle - AI Guide"
    LDI r4, 4
    LDI r0, 3
    LDI r6, 0x3800
    TEXT r4, r0, r6

    ; -- Context info line --
    LDI r4, 4
    LDI r0, 16
    LDI r6, 0x3000
    TEXT r4, r0, r6

    ; -- Separator --
    LDI r12, 0x333344
    LDI r4, 0
    LDI r0, 28
    LDI r6, 256
    LDI r16, 1
    RECTF r4, r0, r6, r16, r12

    ; -- User input --
    LDI r4, 4
    LDI r0, 32
    LDI r6, 0x3100
    TEXT r4, r0, r6

    ; -- Response area --
    LDI r4, 4
    LDI r0, 48
    CALL draw_response

    ; -- Status bar --
    LDI r12, 0x111122
    LDI r4, 0
    LDI r0, 248
    LDI r6, 256
    LDI r16, 8
    RECTF r4, r0, r6, r16, r12
    LDI r4, 4
    LDI r0, 248
    LDI r12, 0x3700
    TEXT r4, r0, r12

    ; -- Input --
    IKEY r9
    LDI r12, 0
    ADD r12, r9
    JZ r12, ml_continue

    CMP r9, r15
    JZ r7, done
    CMP r9, r3
    JZ r7, send_to_llm
    CMP r9, r14
    JZ r7, handle_enter
    CMP r9, r11
    JZ r7, handle_backspace

    ; Regular char: append to input buffer
    LDI r12, 0x3100
    CALL find_null
    LDI r4, 0x32FF
    CMP r12, r4
    BGE r7, ml_continue
    STORE r12, r9

ml_continue:
    FRAME
    JMP main_loop

; ===== Send to LLM =====
send_to_llm:
    ; Status: thinking
    LDI r12, 0x3700
    STRO r12, "Thinking..."

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
    LDI r12, 10
    STORE r19, r12
    ADDI r19, 1
    STORE r19, r12
    ADDI r19, 1
    STRO r19, "Question: "
    CALL advance_to_null

    ; Step 3: copy user input
    LDI r18, 0x3100
    CALL copy_until_null

    ; Step 4: append \n\nAnswer concisely.
    SUBI r19, 1
    LDI r12, 10
    STORE r19, r12
    ADDI r19, 1
    STORE r19, r12
    ADDI r19, 1
    STRO r19, "Answer concisely."
    CALL advance_to_null

    ; Call LLM: reads from 0x3900, writes to 0x3300
    LDI r13, 0x3900
    LLM r13, r2, r8

    ; Clear input
    LDI r12, 0x3100
    LDI r16, 256
    CALL clear_buf

    ; Restore status
    LDI r12, 0x3700
    STRO r12, "Tab=Ask  Esc=Exit  Enter=Clear"

    JMP ml_continue

; ===== Handle Enter: clear input + response =====
handle_enter:
    LDI r12, 0x3100
    LDI r16, 256
    CALL clear_buf
    LDI r12, 0x3300
    LDI r16, 768
    CALL clear_buf
    JMP ml_continue

; ===== Handle Backspace =====
handle_backspace:
    LDI r12, 0x3100
    CALL find_null
    LDI r4, 0x3100
    CMP r12, r4
    JZ r7, ml_continue
    SUBI r12, 1
    LDI r4, 0
    STORE r12, r4
    JMP ml_continue

; ===== Build context string at 0x3000 =====
; Uses r19 as output pointer, r12-r18 as scratch
build_context:
    PUSH r31
    LDI r19, 0x3000

    ; "Pos: ("
    STRO r19, "Pos: ("
    CALL advance_to_null

    ; Player X from RAM[0x7808]
    LDI r12, 0x7808
    LOAD r4, r12
    LDI r12, 0
    ADD r12, r4
    CALL write_decimal

    ; ","
    CALL advance_to_null
    STRO r19, ","
    CALL advance_to_null

    ; Player Y from RAM[0x7809]
    LDI r12, 0x7809
    LOAD r4, r12
    LDI r12, 0
    ADD r12, r4
    CALL write_decimal

    ; ") "
    CALL advance_to_null
    STRO r19, ") "
    CALL advance_to_null

    ; Check nearby building
    LDI r12, 0x7588
    LOAD r4, r12
    LDI r0, 1
    CMP r4, r0
    JNZ r7, no_nearby

    ; "Near: "
    STRO r19, "Near: "
    CALL advance_to_null

    ; Read building name: index at 0x7584
    LDI r12, 0x7584
    LOAD r6, r12        ; r6 = building index
    LDI r0, 4
    MUL r6, r0
    LDI r0, 0x7500
    ADD r6, r0         ; r6 = 0x7500 + index*4
    ADDI r6, 3          ; offset to name_addr field
    LOAD r16, r6        ; r16 = name string address
    ; Copy name chars to output
    LDI r12, 0
copy_bname:
    MOV r17, r16
    ADD r17, r12
    LOAD r4, r17
    LDI r18, 0
    CMP r4, r18
    JZ r7, ctx_done
    STORE r19, r4
    ADDI r19, 1
    ADDI r12, 1
    JMP copy_bname

no_nearby:
    STRO r19, "Explore the world!"

ctx_done:
    LDI r12, 0
    STORE r19, r12
    POP r31
    RET

; ===== Write decimal to string at r19 =====
; r12 = number to write
write_decimal:
    PUSH r31
    PUSH r12
    LDI r4, 0
    CMP r12, r4
    JNZ r7, wd_nonzero
    LDI r4, 48
    STORE r19, r4
    ADDI r19, 1
    JMP wd_done

wd_nonzero:
    LDI r0, 0x3E00     ; temp digit buffer
    LDI r6, 0          ; digit count
wd_loop:
    LDI r4, 0
    CMP r12, r4
    JZ r7, wd_reverse
    LDI r4, 10
    MOV r16, r12
    MOD r16, r4
    ADDI r16, 48
    STORE r0, r16
    ADDI r0, 1
    ADDI r6, 1
    DIV r12, r4
    JMP wd_loop

wd_reverse:
    SUBI r0, 1
wd_rev_loop:
    LDI r4, 0
    CMP r6, r4
    JZ r7, wd_done
    LOAD r16, r0
    STORE r19, r16
    ADDI r19, 1
    SUBI r0, 1
    SUBI r6, 1
    JMP wd_rev_loop

wd_done:
    LDI r12, 0
    STORE r19, r12
    POP r12
    POP r31
    RET

; ===== Advance r19 to null terminator =====
advance_to_null:
    PUSH r31
adv_loop:
    LOAD r12, r19
    LDI r4, 0
    CMP r12, r4
    JZ r7, adv_done
    ADDI r19, 1
    JMP adv_loop
adv_done:
    POP r31
    RET

; ===== Copy from r18 to r19 until null =====
copy_until_null:
    PUSH r31
cun_loop:
    LOAD r12, r18
    LDI r4, 0
    CMP r12, r4
    JZ r7, cun_done
    STORE r19, r12
    ADDI r18, 1
    ADDI r19, 1
    JMP cun_loop
cun_done:
    LDI r12, 0
    STORE r19, r12
    POP r31
    RET

; ===== Find null terminator at r12 =====
find_null:
    PUSH r31
fn_loop:
    LOAD r16, r12
    LDI r4, 0
    CMP r16, r4
    JZ r7, fn_done
    ADDI r12, 1
    JMP fn_loop
fn_done:
    POP r31
    RET

; ===== Clear buffer: r12=start, r16=count =====
clear_buf:
    PUSH r31
    PUSH r12
    PUSH r16
    LDI r4, 0
cb_loop:
    JZ r16, cb_done
    STORE r12, r4
    ADDI r12, 1
    SUBI r16, 1
    JMP cb_loop
cb_done:
    POP r16
    POP r12
    POP r31
    RET

; ===== Draw response text =====
; r4 = start x, r0 = start y
; Delegates to TEXT opcode, which wraps at column ~250 and handles \n.
draw_response:
    PUSH r31
    PUSH r12
    LDI r12, 0x3300     ; response buffer
    TEXT r4, r0, r12
    POP r12
    POP r31
    RET

done:
    HALT
