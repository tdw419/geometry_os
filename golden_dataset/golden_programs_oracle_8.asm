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
;   r10: CMP result (reserved)
;   r2: Key input
;   r15: Prompt addr (0x3900)
;   r11: Response addr (0x3300)
;   r14: Max response length (768)
;   r12: Constant 1
;   r0: Constant 9 (Tab)
;   r9: Constant 10 (Enter)
;   r4: Constant 8 (Backspace)
;   r1: Constant 27 (Escape)
;   r3-r20: scratch

; ===== Initialize =====
LDI r15, 0x3900          ; full prompt addr
LDI r11, 0x3300          ; response buffer
LDI r14, 768             ; max response length
LDI r12, 1
LDI r0, 9               ; Tab
LDI r9, 10              ; Enter
LDI r4, 8              ; Backspace
LDI r1, 27             ; Escape

; Build map context prefix
CALL build_context

; Clear user input and response
LDI r3, 0x3100
LDI r16, 256
CALL clear_buf
LDI r3, 0x3300
LDI r16, 768
CALL clear_buf

; Status
LDI r3, 0x3700
STRO r3, "Tab=Ask  Esc=Exit  Enter=Clear"

; ===== Main Loop =====
main_loop:
    FILL r10

    ; -- Title bar --
    LDI r3, 0x1A0033   ; dark purple
    LDI r6, 0
    LDI r5, 0
    LDI r7, 256
    LDI r16, 14
    RECTF r6, r5, r7, r16, r3

    LDI r3, 0x3800
    STRO r3, "Oracle - AI Guide"
    LDI r6, 4
    LDI r5, 3
    LDI r7, 0x3800
    TEXT r6, r5, r7

    ; -- Context info line --
    LDI r6, 4
    LDI r5, 16
    LDI r7, 0x3000
    TEXT r6, r5, r7

    ; -- Separator --
    LDI r3, 0x333344
    LDI r6, 0
    LDI r5, 28
    LDI r7, 256
    LDI r16, 1
    RECTF r6, r5, r7, r16, r3

    ; -- User input --
    LDI r6, 4
    LDI r5, 32
    LDI r7, 0x3100
    TEXT r6, r5, r7

    ; -- Response area --
    LDI r6, 4
    LDI r5, 48
    CALL draw_response

    ; -- Status bar --
    LDI r3, 0x111122
    LDI r6, 0
    LDI r5, 248
    LDI r7, 256
    LDI r16, 8
    RECTF r6, r5, r7, r16, r3
    LDI r6, 4
    LDI r5, 248
    LDI r3, 0x3700
    TEXT r6, r5, r3

    ; -- Input --
    IKEY r2
    LDI r3, 0
    ADD r3, r2
    JZ r3, ml_continue

    CMP r2, r1
    JZ r10, done
    CMP r2, r0
    JZ r10, send_to_llm
    CMP r2, r9
    JZ r10, handle_enter
    CMP r2, r4
    JZ r10, handle_backspace

    ; Regular char: append to input buffer
    LDI r3, 0x3100
    CALL find_null
    LDI r6, 0x32FF
    CMP r3, r6
    BGE r10, ml_continue
    STORE r3, r2

ml_continue:
    FRAME
    JMP main_loop

; ===== Send to LLM =====
send_to_llm:
    ; Status: thinking
    LDI r3, 0x3700
    STRO r3, "Thinking..."

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
    LDI r3, 10
    STORE r19, r3
    ADDI r19, 1
    STORE r19, r3
    ADDI r19, 1
    STRO r19, "Question: "
    CALL advance_to_null

    ; Step 3: copy user input
    LDI r18, 0x3100
    CALL copy_until_null

    ; Step 4: append \n\nAnswer concisely.
    SUBI r19, 1
    LDI r3, 10
    STORE r19, r3
    ADDI r19, 1
    STORE r19, r3
    ADDI r19, 1
    STRO r19, "Answer concisely."
    CALL advance_to_null

    ; Call LLM: reads from 0x3900, writes to 0x3300
    LDI r15, 0x3900
    LLM r15, r11, r14

    ; Clear input
    LDI r3, 0x3100
    LDI r16, 256
    CALL clear_buf

    ; Restore status
    LDI r3, 0x3700
    STRO r3, "Tab=Ask  Esc=Exit  Enter=Clear"

    JMP ml_continue

; ===== Handle Enter: clear input + response =====
handle_enter:
    LDI r3, 0x3100
    LDI r16, 256
    CALL clear_buf
    LDI r3, 0x3300
    LDI r16, 768
    CALL clear_buf
    JMP ml_continue

; ===== Handle Backspace =====
handle_backspace:
    LDI r3, 0x3100
    CALL find_null
    LDI r6, 0x3100
    CMP r3, r6
    JZ r10, ml_continue
    SUBI r3, 1
    LDI r6, 0
    STORE r3, r6
    JMP ml_continue

; ===== Build context string at 0x3000 =====
; Uses r19 as output pointer, r3-r18 as scratch
build_context:
    PUSH r31
    LDI r19, 0x3000

    ; "Pos: ("
    STRO r19, "Pos: ("
    CALL advance_to_null

    ; Player X from RAM[0x7808]
    LDI r3, 0x7808
    LOAD r6, r3
    LDI r3, 0
    ADD r3, r6
    CALL write_decimal

    ; ","
    CALL advance_to_null
    STRO r19, ","
    CALL advance_to_null

    ; Player Y from RAM[0x7809]
    LDI r3, 0x7809
    LOAD r6, r3
    LDI r3, 0
    ADD r3, r6
    CALL write_decimal

    ; ") "
    CALL advance_to_null
    STRO r19, ") "
    CALL advance_to_null

    ; Check nearby building
    LDI r3, 0x7588
    LOAD r6, r3
    LDI r5, 1
    CMP r6, r5
    JNZ r10, no_nearby

    ; "Near: "
    STRO r19, "Near: "
    CALL advance_to_null

    ; Read building name: index at 0x7584
    LDI r3, 0x7584
    LOAD r7, r3        ; r7 = building index
    LDI r5, 4
    MUL r7, r5
    LDI r5, 0x7500
    ADD r7, r5         ; r7 = 0x7500 + index*4
    ADDI r7, 3          ; offset to name_addr field
    LOAD r16, r7        ; r16 = name string address
    ; Copy name chars to output
    LDI r3, 0
copy_bname:
    MOV r17, r16
    ADD r17, r3
    LOAD r6, r17
    LDI r18, 0
    CMP r6, r18
    JZ r10, ctx_done
    STORE r19, r6
    ADDI r19, 1
    ADDI r3, 1
    JMP copy_bname

no_nearby:
    STRO r19, "Explore the world!"

ctx_done:
    LDI r3, 0
    STORE r19, r3
    POP r31
    RET

; ===== Write decimal to string at r19 =====
; r3 = number to write
write_decimal:
    PUSH r31
    PUSH r3
    LDI r6, 0
    CMP r3, r6
    JNZ r10, wd_nonzero
    LDI r6, 48
    STORE r19, r6
    ADDI r19, 1
    JMP wd_done

wd_nonzero:
    LDI r5, 0x3E00     ; temp digit buffer
    LDI r7, 0          ; digit count
wd_loop:
    LDI r6, 0
    CMP r3, r6
    JZ r10, wd_reverse
    LDI r6, 10
    MOV r16, r3
    MOD r16, r6
    ADDI r16, 48
    STORE r5, r16
    ADDI r5, 1
    ADDI r7, 1
    DIV r3, r6
    JMP wd_loop

wd_reverse:
    SUBI r5, 1
wd_rev_loop:
    LDI r6, 0
    CMP r7, r6
    JZ r10, wd_done
    LOAD r16, r5
    STORE r19, r16
    ADDI r19, 1
    SUBI r5, 1
    SUBI r7, 1
    JMP wd_rev_loop

wd_done:
    LDI r3, 0
    STORE r19, r3
    POP r3
    POP r31
    RET

; ===== Advance r19 to null terminator =====
advance_to_null:
    PUSH r31
adv_loop:
    LOAD r3, r19
    LDI r6, 0
    CMP r3, r6
    JZ r10, adv_done
    ADDI r19, 1
    JMP adv_loop
adv_done:
    POP r31
    RET

; ===== Copy from r18 to r19 until null =====
copy_until_null:
    PUSH r31
cun_loop:
    LOAD r3, r18
    LDI r6, 0
    CMP r3, r6
    JZ r10, cun_done
    STORE r19, r3
    ADDI r18, 1
    ADDI r19, 1
    JMP cun_loop
cun_done:
    LDI r3, 0
    STORE r19, r3
    POP r31
    RET

; ===== Find null terminator at r3 =====
find_null:
    PUSH r31
fn_loop:
    LOAD r16, r3
    LDI r6, 0
    CMP r16, r6
    JZ r10, fn_done
    ADDI r3, 1
    JMP fn_loop
fn_done:
    POP r31
    RET

; ===== Clear buffer: r3=start, r16=count =====
clear_buf:
    PUSH r31
    PUSH r3
    PUSH r16
    LDI r6, 0
cb_loop:
    JZ r16, cb_done
    STORE r3, r6
    ADDI r3, 1
    SUBI r16, 1
    JMP cb_loop
cb_done:
    POP r16
    POP r3
    POP r31
    RET

; ===== Draw response text =====
; r6 = start x, r5 = start y
; Delegates to TEXT opcode, which wraps at column ~250 and handles \n.
draw_response:
    PUSH r31
    PUSH r3
    LDI r3, 0x3300     ; response buffer
    TEXT r6, r5, r3
    POP r3
    POP r31
    RET

done:
    HALT
