; DESCRIPTION: Draw object: pos=the screen, color=red, size=fixed size.

; self_analysis.asm -- Recursive Self-Analysis Program
;
; The OS uses its own LLM to reason about its own screen state.
; Phase 111: "AI inside AI" -- a program that creates visual output,
; then uses SCREENP to sample what it drew, builds a description,
; calls the LLM opcode to analyze it, and writes the result to a file.
;
; Memory layout:
;   0x1000-0x10FF  Screen description buffer (built at runtime)
;   0x1400-0x17FF  LLM prompt buffer (1K)
;   0x1800-0x1FFF  LLM response buffer (2K)
;   0x2000-0x20FF  Working text buffer
;   0x2100-0x211F  File path buffer ("/tmp/screen_analysis.txt")
;   0x2200-0x22FF  Summary text buffer
;
; Registers:
;   r1:  constant 1
;   r30: stack pointer

#define PROMPT_BUF  0x1400
#define RESP_BUF    0x1800
#define TEXT_BUF    0x2000
#define PATH_BUF    0x2100
#define SUMMARY_BUF 0x2200

LDI r1, 1
LDI r30, 0xFD00

; ── PHASE 1: Draw content on screen ──

; Dark background
LDI r15, 0x0A0A14
FILL r15

; Title bar (purple)
LDI r1, 0
LDI r4, 0
LDI r12, 256
LDI r7, 20
LDI r2, 0x2D0050
RECTF r1, r4, r12, r7, r2

; Title text
LDI r20, TEXT_BUF
STRO r20, "Recursive Self-Analysis"
LDI r1, 4
LDI r4, 4
LDI r12, TEXT_BUF
LDI r7, 0xFFFFFF
LDI r2, 0x2D0050
DRAWTEXT r1, r4, r12, r7, r2

; Draw 4 colored quadrants so there's something to detect
; Top-left: red block
LDI r1, 10
LDI r4, 30
LDI r12, 50
LDI r7, 50
LDI r2, 0xFF3333
RECTF r1, r4, r12, r7, r2

; Top-right: green block
LDI r1, 196
LDI r4, 30
LDI r12, 50
LDI r7, 50
LDI r2, 0x33FF33
RECTF r1, r4, r12, r7, r2

; Bottom-left: blue block
LDI r1, 10
LDI r4, 176
LDI r12, 50
LDI r7, 50
LDI r2, 0x3333FF
RECTF r1, r4, r12, r7, r2

; Bottom-right: yellow block
LDI r1, 196
LDI r4, 176
LDI r12, 50
LDI r7, 50
LDI r2, 0xFFFF33
RECTF r1, r4, r12, r7, r2

; Status line: "Sampling..."
LDI r20, TEXT_BUF
STRO r20, "Sampling screen..."
LDI r1, 4
LDI r4, 22
LDI r12, TEXT_BUF
LDI r7, 0xAAAAAA
LDI r2, 0x2D0050
DRAWTEXT r1, r4, r12, r7, r2

FRAME

; ── PHASE 2: Sample screen pixels ──
; Sample a 16x16 grid (every 16 pixels). For each quadrant,
; count non-background (non-0x0A0A14) pixels.

LDI r1, 1

; Quadrant counters: r7=TL, r2=TR, r14=BL, r5=BR
LDI r7, 0
LDI r2, 0
LDI r14, 0
LDI r5, 0

; r13 = row counter (0..15)
LDI r13, 0
sample_row:
    ; r8 = col counter (0..15)
    LDI r8, 0
sample_col:
    ; Compute actual pixel position: x = col*16, y = row*16
    MOV r3, r8
    SHLI r3, 4           ; x = col * 16
    MOV r11, r13
    SHLI r11, 4           ; y = row * 16

    ; Read pixel at (x, y)
    SCREENP r10, r3, r11  ; r10 = pixel color

    ; Check if pixel != background (0x0A0A14)
    LDI r6, 0x0A0A14
    CMP r10, r6
    JZ r15, sample_next    ; background pixel, skip

    ; Non-background pixel -- increment appropriate quadrant
    ; TL: x < 128 and y < 128
    CMPI r3, 128
    BGE r15, sample_check_right
    CMPI r11, 128
    BGE r15, sample_check_bl
    ADDI r7, 1            ; TL++
    JMP sample_next

sample_check_right:
    CMPI r11, 128
    BGE r15, sample_check_br
    ADDI r2, 1            ; TR++
    JMP sample_next

sample_check_bl:
    ADDI r14, 1            ; BL++
    JMP sample_next

sample_check_br:
    ADDI r5, 1            ; BR++
    ; fall through to sample_next

sample_next:
    ADDI r8, 1
    CMPI r8, 16
    JNZ r15, sample_col    ; more columns

    ADDI r13, 1
    CMPI r13, 16
    JNZ r15, sample_row    ; more rows

; ── PHASE 3: Build LLM prompt ──
; Describe the screen state in natural language.
; Store quadrant counts as text in PROMPT_BUF.

LDI r20, PROMPT_BUF
STRO r20, "You are analyzing a 256x256 pixel screen. "
CALL advance_to_null
STRO r20, "I sampled a 16x16 grid of pixels and counted "
CALL advance_to_null
STRO r20, "non-background pixels per quadrant:\n"
CALL advance_to_null

; Append TL count
STRO r20, "Top-left: "
CALL advance_to_null
MOV r15, r7
CALL append_number
STRO r20, " pixels\n"
CALL advance_to_null

; Append TR count
STRO r20, "Top-right: "
CALL advance_to_null
MOV r15, r2
CALL append_number
STRO r20, " pixels\n"
CALL advance_to_null

; Append BL count
STRO r20, "Bottom-left: "
CALL advance_to_null
MOV r15, r14
CALL append_number
STRO r20, " pixels\n"
CALL advance_to_null

; Append BR count
STRO r20, "Bottom-right: "
CALL advance_to_null
MOV r15, r5
CALL append_number
STRO r20, " pixels\n"
CALL advance_to_null

STRO r20, "The screen has a purple title bar at top, "
CALL advance_to_null
STRO r20, "and four colored blocks: red (TL), green (TR), "
CALL advance_to_null
STRO r20, "blue (BL), yellow (BR). "
CALL advance_to_null
STRO r20, "Describe what you see in one sentence."
CALL advance_to_null

; ── PHASE 4: Update status ──
LDI r20, TEXT_BUF
STRO r20, "Calling LLM..."
LDI r1, 4
LDI r4, 22
LDI r12, TEXT_BUF
LDI r7, 0xFFFF00
LDI r2, 0x2D0050
DRAWTEXT r1, r4, r12, r7, r2
FRAME

; ── PHASE 5: Call LLM ──
LDI r4, PROMPT_BUF
LDI r12, RESP_BUF
LDI r7, 512
LLM r4, r12, r7
; r15 = response length

; Save response length
MOV r0, r15

; ── PHASE 6: Display response on screen ──
LDI r20, TEXT_BUF
STRO r20, "LLM Response:"
LDI r1, 4
LDI r4, 80
LDI r12, TEXT_BUF
LDI r7, 0x00FF88
LDI r2, 0x0A0A14
DRAWTEXT r1, r4, r12, r7, r2

; Draw the LLM response text (first 32 chars fit on one line)
LDI r1, 4
LDI r4, 92
LDI r12, RESP_BUF
LDI r7, 0xDDDDDD
LDI r2, 0x0A0A14
DRAWTEXT r1, r4, r12, r7, r2

; ── PHASE 7: Write analysis to file ──
; Prepare file path
LDI r20, PATH_BUF
STRO r20, "/tmp/screen_analysis.txt"

; Open for writing
LDI r1, PATH_BUF
LDI r4, 1            ; mode = write
OPEN r1, r4
; r15 = fd

; Check for error
LDI r6, 0xFFFFFFFF
CMP r15, r6
JZ r15, write_failed

; Save fd
MOV r9, r15

; Write the response to file
MOV r1, r9          ; fd
LDI r4, RESP_BUF     ; buf addr
MOV r12, r0          ; length
WRITESTR r1, r4

; Close file
MOV r1, r9
CLOSE r1

; Show success
LDI r20, SUMMARY_BUF
STRO r20, "Analysis saved to /tmp/screen_analysis.txt"
LDI r1, 4
LDI r4, 140
LDI r12, SUMMARY_BUF
LDI r7, 0x33FF33
LDI r2, 0x0A0A14
DRAWTEXT r1, r4, r12, r7, r2
JMP show_counts

write_failed:
    LDI r20, SUMMARY_BUF
    STRO r20, "File write failed (no sandbox?)"
    LDI r1, 4
    LDI r4, 140
    LDI r12, SUMMARY_BUF
    LDI r7, 0xFF3333
    LDI r2, 0x0A0A14
    DRAWTEXT r1, r4, r12, r7, r2

show_counts:
    ; Show quadrant counts on screen
    LDI r20, SUMMARY_BUF
    STRO r20, "TL:"
    CALL advance_to_null
    MOV r15, r7
    CALL append_number
    STRO r20, " TR:"
    CALL advance_to_null
    MOV r15, r2
    CALL append_number
    STRO r20, " BL:"
    CALL advance_to_null
    MOV r15, r14
    CALL append_number
    STRO r20, " BR:"
    CALL advance_to_null
    MOV r15, r5
    CALL append_number

    LDI r1, 4
    LDI r4, 155
    LDI r12, SUMMARY_BUF
    LDI r7, 0xBBBBBB
    LDI r2, 0x0A0A14
    DRAWTEXT r1, r4, r12, r7, r2

; Final status
LDI r20, TEXT_BUF
STRO r20, "Self-analysis complete."
LDI r1, 4
LDI r4, 22
LDI r12, TEXT_BUF
LDI r7, 0x33FF33
LDI r2, 0x2D0050
DRAWTEXT r1, r4, r12, r7, r2
FRAME

; Halt
LDI r15, 0
EXIT r15

; =========================================
; Subroutines
; =========================================

; advance_to_null -- advance r20 to null terminator
; r20: pointer to string in RAM
advance_to_null:
    PUSH r22
advance_loop:
    LOAD r22, r20
    CMPI r22, 0
    JZ r15, advance_done
    ADDI r20, 1
    JMP advance_loop
advance_done:
    POP r22
    RET

; append_number -- append decimal number to string at r20
; r15: number to append (0-255)
; r20: current position (advanced past written digits)
append_number:
    PUSH r4
    PUSH r12
    PUSH r14
    PUSH r22

    ; Handle 0 special case
    CMPI r15, 0
    JNZ r15, append_nonzero
    LDI r22, 48           ; '0'
    STORE r20, r22
    ADDI r20, 1
    JMP append_done

append_nonzero:
    ; Extract digits into stack (reversed)
    LDI r14, 0             ; digit count
    MOV r4, r15            ; working copy
append_extract:
    CMPI r4, 0
    JZ r15, append_write
    ; r4 % 10
    MOV r12, r4
    LDI r22, 10
    DIV r12, r22           ; r12 = r4 / 10
    MUL r12, r22           ; r12 = (r4/10)*10
    SUB r4, r12            ; r4 = r4 % 10 (digit)
    ADDI r4, 48           ; ASCII digit
    PUSH r4               ; push digit onto stack
    ADDI r14, 1
    MOV r4, r15
    LDI r22, 10
    DIV r4, r22           ; r4 = r15 / 10
    MOV r15, r4            ; update r15 for next iteration
    MOV r4, r15
    JMP append_extract

append_write:
    ; Pop digits in correct order
    CMPI r14, 0
    JZ r15, append_done
    POP r22
    STORE r20, r22
    ADDI r20, 1
    SUBI r14, 1
    JMP append_write

append_done:
    LDI r22, 0
    STORE r20, r22        ; null terminate
    POP r22
    POP r14
    POP r12
    POP r4
    RET
