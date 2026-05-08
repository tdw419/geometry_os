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
;   r13: CMP result (reserved)
;   r5: Key input
;   r11: Prompt addr (0x3900)
;   r2: Response addr (0x3300)
;   r10: Max response length (768)
;   r6: Constant 1
;   r8: Constant 9 (Tab)
;   r3: Constant 10 (Enter)
;   r15: Constant 8 (Backspace)
;   r7: Constant 27 (Escape)
;   r4-r20: scratch

; ===== Initialize =====
LDI r11, 0x3900          ; full prompt addr
LDI r2, 0x3300          ; response buffer
LDI r10, 768             ; max response length
LDI r6, 1
LDI r8, 9               ; Tab
LDI r3, 10              ; Enter
LDI r15, 8              ; Backspace
LDI r7, 27             ; Escape

; Build map context prefix
CALL build_context

; Clear user input and response
LDI r4, 0x3100
LDI r16, 256
CALL clear_buf
LDI r4, 0x3300
LDI r16, 768
CALL clear_buf

; Status
LDI r4, 0x3700
STRO r4, "Tab=Ask  Esc=Exit  Enter=Clear"

; ===== Main Loop =====
main_loop:
    FILL r13

    ; -- Title bar --
    LDI r4, 0x1A0033   ; dark purple
    LDI r1, 0
    LDI r12, 0
    LDI r0, 256
    LDI r16, 14
    RECTF r1, r12, r0, r16, r4

    LDI r4, 0x3800
    STRO r4, "Oracle - AI Guide"
    LDI r1, 4
    LDI r12, 3
    LDI r0, 0x3800
    TEXT r1, r12, r0

    ; -- Context info line --
    LDI r1, 4
    LDI r12, 16
    LDI r0, 0x3000
    TEXT r1, r12, r0

    ; -- Separator --
    LDI r4, 0x333344
    LDI r1, 0
    LDI r12, 28
    LDI r0, 256
    LDI r16, 1
    RECTF r1, r12, r0, r16, r4

    ; -- User input --
    LDI r1, 4
    LDI r12, 32
    LDI r0, 0x3100
    TEXT r1, r12, r0

    ; -- Response area --
    LDI r1, 4
    LDI r12, 48
    CALL draw_response

    ; -- Status bar --
    LDI r4, 0x111122
    LDI r1, 0
    LDI r12, 248
    LDI r0, 256
    LDI r16, 8
    RECTF r1, r12, r0, r16, r4
    LDI r1, 4
    LDI r12, 248
    LDI r4, 0x3700
    TEXT r1, r12, r4

    ; -- Input --
    IKEY r5
    LDI r4, 0
    ADD r4, r5
    JZ r4, ml_continue

    CMP r5, r7
    JZ r13, done
    CMP r5, r8
    JZ r13, send_to_llm
    CMP r5, r3
    JZ r13, handle_enter
    CMP r5, r15
    JZ r13, handle_backspace

    ; Regular char: append to input buffer
    LDI r4, 0x3100
    CALL find_null
    LDI r1, 0x32FF
    CMP r4, r1
    BGE r13, ml_continue
    STORE r4, r5

ml_continue:
    FRAME
    JMP main_loop

; ===== Send to LLM =====
send_to_llm:
    ; Status: thinking
    LDI r4, 0x3700
    STRO r4, "Thinking..."

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
    LDI r4, 10
    STORE r19, r4
    ADDI r19, 1
    STORE r19, r4
    ADDI r19, 1
    STRO r19, "Question: "
    CALL advance_to_null

    ; Step 3: copy user input
    LDI r18, 0x3100
    CALL copy_until_null

    ; Step 4: append \n\nAnswer concisely.
    SUBI r19, 1
    LDI r4, 10
    STORE r19, r4
    ADDI r19, 1
    STORE r19, r4
    ADDI r19, 1
    STRO r19, "Answer concisely."
    CALL advance_to_null

    ; Call LLM: reads from 0x3900, writes to 0x3300
    LDI r11, 0x3900
    LLM r11, r2, r10

    ; Clear input
    LDI r4, 0x3100
    LDI r16, 256
    CALL clear_buf

    ; Restore status
    LDI r4, 0x3700
    STRO r4, "Tab=Ask  Esc=Exit  Enter=Clear"

    JMP ml_continue

; ===== Handle Enter: clear input + response =====
handle_enter:
    LDI r4, 0x3100
    LDI r16, 256
    CALL clear_buf
    LDI r4, 0x3300
    LDI r16, 768
    CALL clear_buf
    JMP ml_continue

; ===== Handle Backspace =====
handle_backspace:
    LDI r4, 0x3100
    CALL find_null
    LDI r1, 0x3100
    CMP r4, r1
    JZ r13, ml_continue
    SUBI r4, 1
    LDI r1, 0
    STORE r4, r1
    JMP ml_continue

; ===== Build context string at 0x3000 =====
; Uses r19 as output pointer, r4-r18 as scratch
build_context:
    PUSH r31
    LDI r19, 0x3000

    ; "Pos: ("
    STRO r19, "Pos: ("
    CALL advance_to_null

    ; Player X from RAM[0x7808]
    LDI r4, 0x7808
    LOAD r1, r4
    LDI r4, 0
    ADD r4, r1
    CALL write_decimal

    ; ","
    CALL advance_to_null
    STRO r19, ","
    CALL advance_to_null

    ; Player Y from RAM[0x7809]
    LDI r4, 0x7809
    LOAD r1, r4
    LDI r4, 0
    ADD r4, r1
    CALL write_decimal

    ; ") "
    CALL advance_to_null
    STRO r19, ") "
    CALL advance_to_null

    ; Check nearby building
    LDI r4, 0x7588
    LOAD r1, r4
    LDI r12, 1
    CMP r1, r12
    JNZ r13, no_nearby

    ; "Near: "
    STRO r19, "Near: "
    CALL advance_to_null

    ; Read building name: index at 0x7584
    LDI r4, 0x7584
    LOAD r0, r4        ; r0 = building index
    LDI r12, 4
    MUL r0, r12
    LDI r12, 0x7500
    ADD r0, r12         ; r0 = 0x7500 + index*4
    ADDI r0, 3          ; offset to name_addr field
    LOAD r16, r0        ; r16 = name string address
    ; Copy name chars to output
    LDI r4, 0
copy_bname:
    MOV r17, r16
    ADD r17, r4
    LOAD r1, r17
    LDI r18, 0
    CMP r1, r18
    JZ r13, ctx_done
    STORE r19, r1
    ADDI r19, 1
    ADDI r4, 1
    JMP copy_bname

no_nearby:
    STRO r19, "Explore the world!"

ctx_done:
    LDI r4, 0
    STORE r19, r4
    POP r31
    RET

; ===== Write decimal to string at r19 =====
; r4 = number to write
write_decimal:
    PUSH r31
    PUSH r4
    LDI r1, 0
    CMP r4, r1
    JNZ r13, wd_nonzero
    LDI r1, 48
    STORE r19, r1
    ADDI r19, 1
    JMP wd_done

wd_nonzero:
    LDI r12, 0x3E00     ; temp digit buffer
    LDI r0, 0          ; digit count
wd_loop:
    LDI r1, 0
    CMP r4, r1
    JZ r13, wd_reverse
    LDI r1, 10
    MOV r16, r4
    MOD r16, r1
    ADDI r16, 48
    STORE r12, r16
    ADDI r12, 1
    ADDI r0, 1
    DIV r4, r1
    JMP wd_loop

wd_reverse:
    SUBI r12, 1
wd_rev_loop:
    LDI r1, 0
    CMP r0, r1
    JZ r13, wd_done
    LOAD r16, r12
    STORE r19, r16
    ADDI r19, 1
    SUBI r12, 1
    SUBI r0, 1
    JMP wd_rev_loop

wd_done:
    LDI r4, 0
    STORE r19, r4
    POP r4
    POP r31
    RET

; ===== Advance r19 to null terminator =====
advance_to_null:
    PUSH r31
adv_loop:
    LOAD r4, r19
    LDI r1, 0
    CMP r4, r1
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
    LOAD r4, r18
    LDI r1, 0
    CMP r4, r1
    JZ r13, cun_done
    STORE r19, r4
    ADDI r18, 1
    ADDI r19, 1
    JMP cun_loop
cun_done:
    LDI r4, 0
    STORE r19, r4
    POP r31
    RET

; ===== Find null terminator at r4 =====
find_null:
    PUSH r31
fn_loop:
    LOAD r16, r4
    LDI r1, 0
    CMP r16, r1
    JZ r13, fn_done
    ADDI r4, 1
    JMP fn_loop
fn_done:
    POP r31
    RET

; ===== Clear buffer: r4=start, r16=count =====
clear_buf:
    PUSH r31
    PUSH r4
    PUSH r16
    LDI r1, 0
cb_loop:
    JZ r16, cb_done
    STORE r4, r1
    ADDI r4, 1
    SUBI r16, 1
    JMP cb_loop
cb_done:
    POP r16
    POP r4
    POP r31
    RET

; ===== Draw response text =====
; r1 = start x, r12 = start y
; Delegates to TEXT opcode, which wraps at column ~250 and handles \n.
draw_response:
    PUSH r31
    PUSH r4
    LDI r4, 0x3300     ; response buffer
    TEXT r1, r12, r4
    POP r4
    POP r31
    RET

done:
    HALT
