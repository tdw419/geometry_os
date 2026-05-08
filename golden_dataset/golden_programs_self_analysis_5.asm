; DESCRIPTION: Display a object using color red at the screen.

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
LDI r10, 0
LDI r1, 256
LDI r3, 20
LDI r2, 0x2D0050
RECTF r0, r10, r1, r3, r2

; Title text
LDI r20, TEXT_BUF
STRO r20, "Recursive Self-Analysis"
LDI r0, 4
LDI r10, 4
LDI r1, TEXT_BUF
LDI r3, 0xFFFFFF
LDI r2, 0x2D0050
DRAWTEXT r0, r10, r1, r3, r2

; Draw 4 colored quadrants so there's something to detect
; Top-left: red block
LDI r0, 10
LDI r10, 30
LDI r1, 50
LDI r3, 50
LDI r2, 0xFF3333
RECTF r0, r10, r1, r3, r2

; Top-right: green block
LDI r0, 196
LDI r10, 30
LDI r1, 50
LDI r3, 50
LDI r2, 0x33FF33
RECTF r0, r10, r1, r3, r2

; Bottom-left: blue block
LDI r0, 10
LDI r10, 176
LDI r1, 50
LDI r3, 50
LDI r2, 0x3333FF
RECTF r0, r10, r1, r3, r2

; Bottom-right: yellow block
LDI r0, 196
LDI r10, 176
LDI r1, 50
LDI r3, 50
LDI r2, 0xFFFF33
RECTF r0, r10, r1, r3, r2

; Status line: "Sampling..."
LDI r20, TEXT_BUF
STRO r20, "Sampling screen..."
LDI r0, 4
LDI r10, 22
LDI r1, TEXT_BUF
LDI r3, 0xAAAAAA
LDI r2, 0x2D0050
DRAWTEXT r0, r10, r1, r3, r2

FRAME

; ── PHASE 2: Sample screen pixels ──
; Sample a 16x16 grid (every 16 pixels). For each quadrant,
; count non-background (non-0x0A0A14) pixels.

LDI r0, 1

; Quadrant counters: r3=TL, r2=TR, r8=BL, r6=BR
LDI r3, 0
LDI r2, 0
LDI r8, 0
LDI r6, 0

; r5 = row counter (0..15)
LDI r5, 0
sample_row:
    ; r11 = col counter (0..15)
    LDI r11, 0
sample_col:
    ; Compute actual pixel position: x = col*16, y = row*16
    MOV r14, r11
    SHLI r14, 4           ; x = col * 16
    MOV r4, r5
    SHLI r4, 4           ; y = row * 16

    ; Read pixel at (x, y)
    SCREENP r9, r14, r4  ; r9 = pixel color

    ; Check if pixel != background (0x0A0A14)
    LDI r12, 0x0A0A14
    CMP r9, r12
    JZ r7, sample_next    ; background pixel, skip

    ; Non-background pixel -- increment appropriate quadrant
    ; TL: x < 128 and y < 128
    CMPI r14, 128
    BGE r7, sample_check_right
    CMPI r4, 128
    BGE r7, sample_check_bl
    ADDI r3, 1            ; TL++
    JMP sample_next

sample_check_right:
    CMPI r4, 128
    BGE r7, sample_check_br
    ADDI r2, 1            ; TR++
    JMP sample_next

sample_check_bl:
    ADDI r8, 1            ; BL++
    JMP sample_next

sample_check_br:
    ADDI r6, 1            ; BR++
    ; fall through to sample_next

sample_next:
    ADDI r11, 1
    CMPI r11, 16
    JNZ r7, sample_col    ; more columns

    ADDI r5, 1
    CMPI r5, 16
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
MOV r7, r3
CALL append_number
STRO r20, " pixels\n"
CALL advance_to_null

; Append TR count
STRO r20, "Top-right: "
CALL advance_to_null
MOV r7, r2
CALL append_number
STRO r20, " pixels\n"
CALL advance_to_null

; Append BL count
STRO r20, "Bottom-left: "
CALL advance_to_null
MOV r7, r8
CALL append_number
STRO r20, " pixels\n"
CALL advance_to_null

; Append BR count
STRO r20, "Bottom-right: "
CALL advance_to_null
MOV r7, r6
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
LDI r10, 22
LDI r1, TEXT_BUF
LDI r3, 0xFFFF00
LDI r2, 0x2D0050
DRAWTEXT r0, r10, r1, r3, r2
FRAME

; ── PHASE 5: Call LLM ──
LDI r10, PROMPT_BUF
LDI r1, RESP_BUF
LDI r3, 512
LLM r10, r1, r3
; r7 = response length

; Save response length
MOV r13, r7

; ── PHASE 6: Display response on screen ──
LDI r20, TEXT_BUF
STRO r20, "LLM Response:"
LDI r0, 4
LDI r10, 80
LDI r1, TEXT_BUF
LDI r3, 0x00FF88
LDI r2, 0x0A0A14
DRAWTEXT r0, r10, r1, r3, r2

; Draw the LLM response text (first 32 chars fit on one line)
LDI r0, 4
LDI r10, 92
LDI r1, RESP_BUF
LDI r3, 0xDDDDDD
LDI r2, 0x0A0A14
DRAWTEXT r0, r10, r1, r3, r2

; ── PHASE 7: Write analysis to file ──
; Prepare file path
LDI r20, PATH_BUF
STRO r20, "/tmp/screen_analysis.txt"

; Open for writing
LDI r0, PATH_BUF
LDI r10, 1            ; mode = write
OPEN r0, r10
; r7 = fd

; Check for error
LDI r12, 0xFFFFFFFF
CMP r7, r12
JZ r7, write_failed

; Save fd
MOV r15, r7

; Write the response to file
MOV r0, r15          ; fd
LDI r10, RESP_BUF     ; buf addr
MOV r1, r13          ; length
WRITESTR r0, r10

; Close file
MOV r0, r15
CLOSE r0

; Show success
LDI r20, SUMMARY_BUF
STRO r20, "Analysis saved to /tmp/screen_analysis.txt"
LDI r0, 4
LDI r10, 140
LDI r1, SUMMARY_BUF
LDI r3, 0x33FF33
LDI r2, 0x0A0A14
DRAWTEXT r0, r10, r1, r3, r2
JMP show_counts

write_failed:
    LDI r20, SUMMARY_BUF
    STRO r20, "File write failed (no sandbox?)"
    LDI r0, 4
    LDI r10, 140
    LDI r1, SUMMARY_BUF
    LDI r3, 0xFF3333
    LDI r2, 0x0A0A14
    DRAWTEXT r0, r10, r1, r3, r2

show_counts:
    ; Show quadrant counts on screen
    LDI r20, SUMMARY_BUF
    STRO r20, "TL:"
    CALL advance_to_null
    MOV r7, r3
    CALL append_number
    STRO r20, " TR:"
    CALL advance_to_null
    MOV r7, r2
    CALL append_number
    STRO r20, " BL:"
    CALL advance_to_null
    MOV r7, r8
    CALL append_number
    STRO r20, " BR:"
    CALL advance_to_null
    MOV r7, r6
    CALL append_number

    LDI r0, 4
    LDI r10, 155
    LDI r1, SUMMARY_BUF
    LDI r3, 0xBBBBBB
    LDI r2, 0x0A0A14
    DRAWTEXT r0, r10, r1, r3, r2

; Final status
LDI r20, TEXT_BUF
STRO r20, "Self-analysis complete."
LDI r0, 4
LDI r10, 22
LDI r1, TEXT_BUF
LDI r3, 0x33FF33
LDI r2, 0x2D0050
DRAWTEXT r0, r10, r1, r3, r2
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
    PUSH r10
    PUSH r1
    PUSH r8
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
    LDI r8, 0             ; digit count
    MOV r10, r7            ; working copy
append_extract:
    CMPI r10, 0
    JZ r7, append_write
    ; r10 % 10
    MOV r1, r10
    LDI r22, 10
    DIV r1, r22           ; r1 = r10 / 10
    MUL r1, r22           ; r1 = (r10/10)*10
    SUB r10, r1            ; r10 = r10 % 10 (digit)
    ADDI r10, 48           ; ASCII digit
    PUSH r10               ; push digit onto stack
    ADDI r8, 1
    MOV r10, r7
    LDI r22, 10
    DIV r10, r22           ; r10 = r7 / 10
    MOV r7, r10            ; update r7 for next iteration
    MOV r10, r7
    JMP append_extract

append_write:
    ; Pop digits in correct order
    CMPI r8, 0
    JZ r7, append_done
    POP r22
    STORE r20, r22
    ADDI r20, 1
    SUBI r8, 1
    JMP append_write

append_done:
    LDI r22, 0
    STORE r20, r22        ; null terminate
    POP r22
    POP r8
    POP r1
    POP r10
    RET
