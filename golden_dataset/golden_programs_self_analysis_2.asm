; DESCRIPTION: Geometry OS program to draw a red object.

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
;   r0:  constant 1
;   r30: stack pointer

#define PROMPT_BUF  0x1400
#define RESP_BUF    0x1800
#define TEXT_BUF    0x2000
#define PATH_BUF    0x2100
#define SUMMARY_BUF 0x2200

LDI r0, 1
LDI r30, 0xFD00

; ── PHASE 1: Draw content on screen ──

; Dark background
LDI r7, 0x0A0A14
FILL r7

; Title bar (purple)
LDI r0, 0
LDI r13, 0
LDI r12, 256
LDI r6, 20
LDI r9, 0x2D0050
RECTF r0, r13, r12, r6, r9

; Title text
LDI r20, TEXT_BUF
STRO r20, "Recursive Self-Analysis"
LDI r0, 4
LDI r13, 4
LDI r12, TEXT_BUF
LDI r6, 0xFFFFFF
LDI r9, 0x2D0050
DRAWTEXT r0, r13, r12, r6, r9

; Draw 4 colored quadrants so there's something to detect
; Top-left: red block
LDI r0, 10
LDI r13, 30
LDI r12, 50
LDI r6, 50
LDI r9, 0xFF3333
RECTF r0, r13, r12, r6, r9

; Top-right: green block
LDI r0, 196
LDI r13, 30
LDI r12, 50
LDI r6, 50
LDI r9, 0x33FF33
RECTF r0, r13, r12, r6, r9

; Bottom-left: blue block
LDI r0, 10
LDI r13, 176
LDI r12, 50
LDI r6, 50
LDI r9, 0x3333FF
RECTF r0, r13, r12, r6, r9

; Bottom-right: yellow block
LDI r0, 196
LDI r13, 176
LDI r12, 50
LDI r6, 50
LDI r9, 0xFFFF33
RECTF r0, r13, r12, r6, r9

; Status line: "Sampling..."
LDI r20, TEXT_BUF
STRO r20, "Sampling screen..."
LDI r0, 4
LDI r13, 22
LDI r12, TEXT_BUF
LDI r6, 0xAAAAAA
LDI r9, 0x2D0050
DRAWTEXT r0, r13, r12, r6, r9

FRAME

; ── PHASE 2: Sample screen pixels ──
; Sample a 16x16 grid (every 16 pixels). For each quadrant,
; count non-background (non-0x0A0A14) pixels.

LDI r0, 1

; Quadrant counters: r6=TL, r9=TR, r10=BL, r1=BR
LDI r6, 0
LDI r9, 0
LDI r10, 0
LDI r1, 0

; r3 = row counter (0..15)
LDI r3, 0
sample_row:
    ; r2 = col counter (0..15)
    LDI r2, 0
sample_col:
    ; Compute actual pixel position: x = col*16, y = row*16
    MOV r8, r2
    SHLI r8, 4           ; x = col * 16
    MOV r11, r3
    SHLI r11, 4           ; y = row * 16

    ; Read pixel at (x, y)
    SCREENP r15, r8, r11  ; r15 = pixel color

    ; Check if pixel != background (0x0A0A14)
    LDI r4, 0x0A0A14
    CMP r15, r4
    JZ r7, sample_next    ; background pixel, skip

    ; Non-background pixel -- increment appropriate quadrant
    ; TL: x < 128 and y < 128
    CMPI r8, 128
    BGE r7, sample_check_right
    CMPI r11, 128
    BGE r7, sample_check_bl
    ADDI r6, 1            ; TL++
    JMP sample_next

sample_check_right:
    CMPI r11, 128
    BGE r7, sample_check_br
    ADDI r9, 1            ; TR++
    JMP sample_next

sample_check_bl:
    ADDI r10, 1            ; BL++
    JMP sample_next

sample_check_br:
    ADDI r1, 1            ; BR++
    ; fall through to sample_next

sample_next:
    ADDI r2, 1
    CMPI r2, 16
    JNZ r7, sample_col    ; more columns

    ADDI r3, 1
    CMPI r3, 16
    JNZ r7, sample_row    ; more rows

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
MOV r7, r6
CALL append_number
STRO r20, " pixels\n"
CALL advance_to_null

; Append TR count
STRO r20, "Top-right: "
CALL advance_to_null
MOV r7, r9
CALL append_number
STRO r20, " pixels\n"
CALL advance_to_null

; Append BL count
STRO r20, "Bottom-left: "
CALL advance_to_null
MOV r7, r10
CALL append_number
STRO r20, " pixels\n"
CALL advance_to_null

; Append BR count
STRO r20, "Bottom-right: "
CALL advance_to_null
MOV r7, r1
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
LDI r0, 4
LDI r13, 22
LDI r12, TEXT_BUF
LDI r6, 0xFFFF00
LDI r9, 0x2D0050
DRAWTEXT r0, r13, r12, r6, r9
FRAME

; ── PHASE 5: Call LLM ──
LDI r13, PROMPT_BUF
LDI r12, RESP_BUF
LDI r6, 512
LLM r13, r12, r6
; r7 = response length

; Save response length
MOV r5, r7

; ── PHASE 6: Display response on screen ──
LDI r20, TEXT_BUF
STRO r20, "LLM Response:"
LDI r0, 4
LDI r13, 80
LDI r12, TEXT_BUF
LDI r6, 0x00FF88
LDI r9, 0x0A0A14
DRAWTEXT r0, r13, r12, r6, r9

; Draw the LLM response text (first 32 chars fit on one line)
LDI r0, 4
LDI r13, 92
LDI r12, RESP_BUF
LDI r6, 0xDDDDDD
LDI r9, 0x0A0A14
DRAWTEXT r0, r13, r12, r6, r9

; ── PHASE 7: Write analysis to file ──
; Prepare file path
LDI r20, PATH_BUF
STRO r20, "/tmp/screen_analysis.txt"

; Open for writing
LDI r0, PATH_BUF
LDI r13, 1            ; mode = write
OPEN r0, r13
; r7 = fd

; Check for error
LDI r4, 0xFFFFFFFF
CMP r7, r4
JZ r7, write_failed

; Save fd
MOV r14, r7

; Write the response to file
MOV r0, r14          ; fd
LDI r13, RESP_BUF     ; buf addr
MOV r12, r5          ; length
WRITESTR r0, r13

; Close file
MOV r0, r14
CLOSE r0

; Show success
LDI r20, SUMMARY_BUF
STRO r20, "Analysis saved to /tmp/screen_analysis.txt"
LDI r0, 4
LDI r13, 140
LDI r12, SUMMARY_BUF
LDI r6, 0x33FF33
LDI r9, 0x0A0A14
DRAWTEXT r0, r13, r12, r6, r9
JMP show_counts

write_failed:
    LDI r20, SUMMARY_BUF
    STRO r20, "File write failed (no sandbox?)"
    LDI r0, 4
    LDI r13, 140
    LDI r12, SUMMARY_BUF
    LDI r6, 0xFF3333
    LDI r9, 0x0A0A14
    DRAWTEXT r0, r13, r12, r6, r9

show_counts:
    ; Show quadrant counts on screen
    LDI r20, SUMMARY_BUF
    STRO r20, "TL:"
    CALL advance_to_null
    MOV r7, r6
    CALL append_number
    STRO r20, " TR:"
    CALL advance_to_null
    MOV r7, r9
    CALL append_number
    STRO r20, " BL:"
    CALL advance_to_null
    MOV r7, r10
    CALL append_number
    STRO r20, " BR:"
    CALL advance_to_null
    MOV r7, r1
    CALL append_number

    LDI r0, 4
    LDI r13, 155
    LDI r12, SUMMARY_BUF
    LDI r6, 0xBBBBBB
    LDI r9, 0x0A0A14
    DRAWTEXT r0, r13, r12, r6, r9

; Final status
LDI r20, TEXT_BUF
STRO r20, "Self-analysis complete."
LDI r0, 4
LDI r13, 22
LDI r12, TEXT_BUF
LDI r6, 0x33FF33
LDI r9, 0x2D0050
DRAWTEXT r0, r13, r12, r6, r9
FRAME

; Halt
LDI r7, 0
EXIT r7

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
    JZ r7, advance_done
    ADDI r20, 1
    JMP advance_loop
advance_done:
    POP r22
    RET

; append_number -- append decimal number to string at r20
; r7: number to append (0-255)
; r20: current position (advanced past written digits)
append_number:
    PUSH r13
    PUSH r12
    PUSH r10
    PUSH r22

    ; Handle 0 special case
    CMPI r7, 0
    JNZ r7, append_nonzero
    LDI r22, 48           ; '0'
    STORE r20, r22
    ADDI r20, 1
    JMP append_done

append_nonzero:
    ; Extract digits into stack (reversed)
    LDI r10, 0             ; digit count
    MOV r13, r7            ; working copy
append_extract:
    CMPI r13, 0
    JZ r7, append_write
    ; r13 % 10
    MOV r12, r13
    LDI r22, 10
    DIV r12, r22           ; r12 = r13 / 10
    MUL r12, r22           ; r12 = (r13/10)*10
    SUB r13, r12            ; r13 = r13 % 10 (digit)
    ADDI r13, 48           ; ASCII digit
    PUSH r13               ; push digit onto stack
    ADDI r10, 1
    MOV r13, r7
    LDI r22, 10
    DIV r13, r22           ; r13 = r7 / 10
    MOV r7, r13            ; update r7 for next iteration
    MOV r13, r7
    JMP append_extract

append_write:
    ; Pop digits in correct order
    CMPI r10, 0
    JZ r7, append_done
    POP r22
    STORE r20, r22
    ADDI r20, 1
    SUBI r10, 1
    JMP append_write

append_done:
    LDI r22, 0
    STORE r20, r22        ; null terminate
    POP r22
    POP r10
    POP r12
    POP r13
    RET
