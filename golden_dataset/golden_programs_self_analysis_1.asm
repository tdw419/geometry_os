; DESCRIPTION: Render a red object at the screen.

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
LDI r3, 0x0A0A14
FILL r3

; Title bar (purple)
LDI r1, 0
LDI r0, 0
LDI r9, 256
LDI r14, 20
LDI r6, 0x2D0050
RECTF r1, r0, r9, r14, r6

; Title text
LDI r20, TEXT_BUF
STRO r20, "Recursive Self-Analysis"
LDI r1, 4
LDI r0, 4
LDI r9, TEXT_BUF
LDI r14, 0xFFFFFF
LDI r6, 0x2D0050
DRAWTEXT r1, r0, r9, r14, r6

; Draw 4 colored quadrants so there's something to detect
; Top-left: red block
LDI r1, 10
LDI r0, 30
LDI r9, 50
LDI r14, 50
LDI r6, 0xFF3333
RECTF r1, r0, r9, r14, r6

; Top-right: green block
LDI r1, 196
LDI r0, 30
LDI r9, 50
LDI r14, 50
LDI r6, 0x33FF33
RECTF r1, r0, r9, r14, r6

; Bottom-left: blue block
LDI r1, 10
LDI r0, 176
LDI r9, 50
LDI r14, 50
LDI r6, 0x3333FF
RECTF r1, r0, r9, r14, r6

; Bottom-right: yellow block
LDI r1, 196
LDI r0, 176
LDI r9, 50
LDI r14, 50
LDI r6, 0xFFFF33
RECTF r1, r0, r9, r14, r6

; Status line: "Sampling..."
LDI r20, TEXT_BUF
STRO r20, "Sampling screen..."
LDI r1, 4
LDI r0, 22
LDI r9, TEXT_BUF
LDI r14, 0xAAAAAA
LDI r6, 0x2D0050
DRAWTEXT r1, r0, r9, r14, r6

FRAME

; ── PHASE 2: Sample screen pixels ──
; Sample a 16x16 grid (every 16 pixels). For each quadrant,
; count non-background (non-0x0A0A14) pixels.

LDI r1, 1

; Quadrant counters: r14=TL, r6=TR, r4=BL, r7=BR
LDI r14, 0
LDI r6, 0
LDI r4, 0
LDI r7, 0

; r8 = row counter (0..15)
LDI r8, 0
sample_row:
    ; r12 = col counter (0..15)
    LDI r12, 0
sample_col:
    ; Compute actual pixel position: x = col*16, y = row*16
    MOV r11, r12
    SHLI r11, 4           ; x = col * 16
    MOV r13, r8
    SHLI r13, 4           ; y = row * 16

    ; Read pixel at (x, y)
    SCREENP r15, r11, r13  ; r15 = pixel color

    ; Check if pixel != background (0x0A0A14)
    LDI r10, 0x0A0A14
    CMP r15, r10
    JZ r3, sample_next    ; background pixel, skip

    ; Non-background pixel -- increment appropriate quadrant
    ; TL: x < 128 and y < 128
    CMPI r11, 128
    BGE r3, sample_check_right
    CMPI r13, 128
    BGE r3, sample_check_bl
    ADDI r14, 1            ; TL++
    JMP sample_next

sample_check_right:
    CMPI r13, 128
    BGE r3, sample_check_br
    ADDI r6, 1            ; TR++
    JMP sample_next

sample_check_bl:
    ADDI r4, 1            ; BL++
    JMP sample_next

sample_check_br:
    ADDI r7, 1            ; BR++
    ; fall through to sample_next

sample_next:
    ADDI r12, 1
    CMPI r12, 16
    JNZ r3, sample_col    ; more columns

    ADDI r8, 1
    CMPI r8, 16
    JNZ r3, sample_row    ; more rows

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
MOV r3, r14
CALL append_number
STRO r20, " pixels\n"
CALL advance_to_null

; Append TR count
STRO r20, "Top-right: "
CALL advance_to_null
MOV r3, r6
CALL append_number
STRO r20, " pixels\n"
CALL advance_to_null

; Append BL count
STRO r20, "Bottom-left: "
CALL advance_to_null
MOV r3, r4
CALL append_number
STRO r20, " pixels\n"
CALL advance_to_null

; Append BR count
STRO r20, "Bottom-right: "
CALL advance_to_null
MOV r3, r7
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
LDI r0, 22
LDI r9, TEXT_BUF
LDI r14, 0xFFFF00
LDI r6, 0x2D0050
DRAWTEXT r1, r0, r9, r14, r6
FRAME

; ── PHASE 5: Call LLM ──
LDI r0, PROMPT_BUF
LDI r9, RESP_BUF
LDI r14, 512
LLM r0, r9, r14
; r3 = response length

; Save response length
MOV r2, r3

; ── PHASE 6: Display response on screen ──
LDI r20, TEXT_BUF
STRO r20, "LLM Response:"
LDI r1, 4
LDI r0, 80
LDI r9, TEXT_BUF
LDI r14, 0x00FF88
LDI r6, 0x0A0A14
DRAWTEXT r1, r0, r9, r14, r6

; Draw the LLM response text (first 32 chars fit on one line)
LDI r1, 4
LDI r0, 92
LDI r9, RESP_BUF
LDI r14, 0xDDDDDD
LDI r6, 0x0A0A14
DRAWTEXT r1, r0, r9, r14, r6

; ── PHASE 7: Write analysis to file ──
; Prepare file path
LDI r20, PATH_BUF
STRO r20, "/tmp/screen_analysis.txt"

; Open for writing
LDI r1, PATH_BUF
LDI r0, 1            ; mode = write
OPEN r1, r0
; r3 = fd

; Check for error
LDI r10, 0xFFFFFFFF
CMP r3, r10
JZ r3, write_failed

; Save fd
MOV r5, r3

; Write the response to file
MOV r1, r5          ; fd
LDI r0, RESP_BUF     ; buf addr
MOV r9, r2          ; length
WRITESTR r1, r0

; Close file
MOV r1, r5
CLOSE r1

; Show success
LDI r20, SUMMARY_BUF
STRO r20, "Analysis saved to /tmp/screen_analysis.txt"
LDI r1, 4
LDI r0, 140
LDI r9, SUMMARY_BUF
LDI r14, 0x33FF33
LDI r6, 0x0A0A14
DRAWTEXT r1, r0, r9, r14, r6
JMP show_counts

write_failed:
    LDI r20, SUMMARY_BUF
    STRO r20, "File write failed (no sandbox?)"
    LDI r1, 4
    LDI r0, 140
    LDI r9, SUMMARY_BUF
    LDI r14, 0xFF3333
    LDI r6, 0x0A0A14
    DRAWTEXT r1, r0, r9, r14, r6

show_counts:
    ; Show quadrant counts on screen
    LDI r20, SUMMARY_BUF
    STRO r20, "TL:"
    CALL advance_to_null
    MOV r3, r14
    CALL append_number
    STRO r20, " TR:"
    CALL advance_to_null
    MOV r3, r6
    CALL append_number
    STRO r20, " BL:"
    CALL advance_to_null
    MOV r3, r4
    CALL append_number
    STRO r20, " BR:"
    CALL advance_to_null
    MOV r3, r7
    CALL append_number

    LDI r1, 4
    LDI r0, 155
    LDI r9, SUMMARY_BUF
    LDI r14, 0xBBBBBB
    LDI r6, 0x0A0A14
    DRAWTEXT r1, r0, r9, r14, r6

; Final status
LDI r20, TEXT_BUF
STRO r20, "Self-analysis complete."
LDI r1, 4
LDI r0, 22
LDI r9, TEXT_BUF
LDI r14, 0x33FF33
LDI r6, 0x2D0050
DRAWTEXT r1, r0, r9, r14, r6
FRAME

; Halt
LDI r3, 0
EXIT r3

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
    JZ r3, advance_done
    ADDI r20, 1
    JMP advance_loop
advance_done:
    POP r22
    RET

; append_number -- append decimal number to string at r20
; r3: number to append (0-255)
; r20: current position (advanced past written digits)
append_number:
    PUSH r0
    PUSH r9
    PUSH r4
    PUSH r22

    ; Handle 0 special case
    CMPI r3, 0
    JNZ r3, append_nonzero
    LDI r22, 48           ; '0'
    STORE r20, r22
    ADDI r20, 1
    JMP append_done

append_nonzero:
    ; Extract digits into stack (reversed)
    LDI r4, 0             ; digit count
    MOV r0, r3            ; working copy
append_extract:
    CMPI r0, 0
    JZ r3, append_write
    ; r0 % 10
    MOV r9, r0
    LDI r22, 10
    DIV r9, r22           ; r9 = r0 / 10
    MUL r9, r22           ; r9 = (r0/10)*10
    SUB r0, r9            ; r0 = r0 % 10 (digit)
    ADDI r0, 48           ; ASCII digit
    PUSH r0               ; push digit onto stack
    ADDI r4, 1
    MOV r0, r3
    LDI r22, 10
    DIV r0, r22           ; r0 = r3 / 10
    MOV r3, r0            ; update r3 for next iteration
    MOV r0, r3
    JMP append_extract

append_write:
    ; Pop digits in correct order
    CMPI r4, 0
    JZ r3, append_done
    POP r22
    STORE r20, r22
    ADDI r20, 1
    SUBI r4, 1
    JMP append_write

append_done:
    LDI r22, 0
    STORE r20, r22        ; null terminate
    POP r22
    POP r4
    POP r9
    POP r0
    RET
