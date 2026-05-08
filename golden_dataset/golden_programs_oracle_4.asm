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
;   r5: CMP result (reserved)
;   r14: Key input
;   r7: Prompt addr (0x3900)
;   r10: Response addr (0x3300)
;   r3: Max response length (768)
;   r12: Constant 1
;   r9: Constant 9 (Tab)
;   r11: Constant 10 (Enter)
;   r0: Constant 8 (Backspace)
;   r1: Constant 27 (Escape)
;   r4-r20: scratch

; ===== Initialize =====
LDI r7, 0x3900          ; full prompt addr
LDI r10, 0x3300          ; response buffer
LDI r3, 768             ; max response length
LDI r12, 1
LDI r9, 9               ; Tab
LDI r11, 10              ; Enter
LDI r0, 8              ; Backspace
LDI r1, 27             ; Escape

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
    FILL r5

    ; -- Title bar --
    LDI r4, 0x1A0033   ; dark purple
    LDI r8, 0
    LDI r15, 0
    LDI r2, 256
    LDI r16, 14
    RECTF r8, r15, r2, r16, r4

    LDI r4, 0x3800
    STRO r4, "Oracle - AI Guide"
    LDI r8, 4
    LDI r15, 3
    LDI r2, 0x3800
    TEXT r8, r15, r2

    ; -- Context info line --
    LDI r8, 4
    LDI r15, 16
    LDI r2, 0x3000
    TEXT r8, r15, r2

    ; -- Separator --
    LDI r4, 0x333344
    LDI r8, 0
    LDI r15, 28
    LDI r2, 256
    LDI r16, 1
    RECTF r8, r15, r2, r16, r4

    ; -- User input --
    LDI r8, 4
    LDI r15, 32
    LDI r2, 0x3100
    TEXT r8, r15, r2

    ; -- Response area --
    LDI r8, 4
    LDI r15, 48
    CALL draw_response

    ; -- Status bar --
    LDI r4, 0x111122
    LDI r8, 0
    LDI r15, 248
    LDI r2, 256
    LDI r16, 8
    RECTF r8, r15, r2, r16, r4
    LDI r8, 4
    LDI r15, 248
    LDI r4, 0x3700
    TEXT r8, r15, r4

    ; -- Input --
    IKEY r14
    LDI r4, 0
    ADD r4, r14
    JZ r4, ml_continue

    CMP r14, r1
    JZ r5, done
    CMP r14, r9
    JZ r5, send_to_llm
    CMP r14, r11
    JZ r5, handle_enter
    CMP r14, r0
    JZ r5, handle_backspace

    ; Regular char: append to input buffer
    LDI r4, 0x3100
    CALL find_null
    LDI r8, 0x32FF
    CMP r4, r8
    BGE r5, ml_continue
    STORE r4, r14

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
    LDI r7, 0x3900
    LLM r7, r10, r3

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
    LDI r8, 0x3100
    CMP r4, r8
    JZ r5, ml_continue
    SUBI r4, 1
    LDI r8, 0
    STORE r4, r8
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
    LOAD r8, r4
    LDI r4, 0
    ADD r4, r8
    CALL write_decimal

    ; ","
    CALL advance_to_null
    STRO r19, ","
    CALL advance_to_null

    ; Player Y from RAM[0x7809]
    LDI r4, 0x7809
    LOAD r8, r4
    LDI r4, 0
    ADD r4, r8
    CALL write_decimal

    ; ") "
    CALL advance_to_null
    STRO r19, ") "
    CALL advance_to_null

    ; Check nearby building
    LDI r4, 0x7588
    LOAD r8, r4
    LDI r15, 1
    CMP r8, r15
    JNZ r5, no_nearby

    ; "Near: "
    STRO r19, "Near: "
    CALL advance_to_null

    ; Read building name: index at 0x7584
    LDI r4, 0x7584
    LOAD r2, r4        ; r2 = building index
    LDI r15, 4
    MUL r2, r15
    LDI r15, 0x7500
    ADD r2, r15         ; r2 = 0x7500 + index*4
    ADDI r2, 3          ; offset to name_addr field
    LOAD r16, r2        ; r16 = name string address
    ; Copy name chars to output
    LDI r4, 0
copy_bname:
    MOV r17, r16
    ADD r17, r4
    LOAD r8, r17
    LDI r18, 0
    CMP r8, r18
    JZ r5, ctx_done
    STORE r19, r8
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
    LDI r8, 0
    CMP r4, r8
    JNZ r5, wd_nonzero
    LDI r8, 48
    STORE r19, r8
    ADDI r19, 1
    JMP wd_done

wd_nonzero:
    LDI r15, 0x3E00     ; temp digit buffer
    LDI r2, 0          ; digit count
wd_loop:
    LDI r8, 0
    CMP r4, r8
    JZ r5, wd_reverse
    LDI r8, 10
    MOV r16, r4
    MOD r16, r8
    ADDI r16, 48
    STORE r15, r16
    ADDI r15, 1
    ADDI r2, 1
    DIV r4, r8
    JMP wd_loop

wd_reverse:
    SUBI r15, 1
wd_rev_loop:
    LDI r8, 0
    CMP r2, r8
    JZ r5, wd_done
    LOAD r16, r15
    STORE r19, r16
    ADDI r19, 1
    SUBI r15, 1
    SUBI r2, 1
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
    LDI r8, 0
    CMP r4, r8
    JZ r5, adv_done
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
    LDI r8, 0
    CMP r4, r8
    JZ r5, cun_done
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
    LDI r8, 0
    CMP r16, r8
    JZ r5, fn_done
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
    LDI r8, 0
cb_loop:
    JZ r16, cb_done
    STORE r4, r8
    ADDI r4, 1
    SUBI r16, 1
    JMP cb_loop
cb_done:
    POP r16
    POP r4
    POP r31
    RET

; ===== Draw response text =====
; r8 = start x, r15 = start y
; Delegates to TEXT opcode, which wraps at column ~250 and handles \n.
draw_response:
    PUSH r31
    PUSH r4
    LDI r4, 0x3300     ; response buffer
    TEXT r8, r15, r4
    POP r4
    POP r31
    RET

done:
    HALT
