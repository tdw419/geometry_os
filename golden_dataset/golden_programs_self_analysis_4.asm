; DESCRIPTION: This GeOS assembly code performs a recursive self-analysis by drawing content on the screen, sampling pixel data, constructing a prompt for a Language Learning Model (LLM) to analyze the drawn image, and then writing the LLM's response to a file. The process involves drawing a title bar, four colored quadrants, sampling the screen's pixels to count non-background colors, generating a natural language description of the scene, calling the LLM, displaying its response, and saving it to disk along with quadrant counts.

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
;   r14:  constant 1
;   r30: stack pointer

#define PROMPT_BUF  0x1400
#define RESP_BUF    0x1800
#define TEXT_BUF    0x2000
#define PATH_BUF    0x2100
#define SUMMARY_BUF 0x2200

LDI r14, 1
LDI r30, 0xFD00

; ── PHASE 1: Draw content on screen ──

; Dark background
LDI r2, 0x0A0A14
FILL r2

; Title bar (purple)
LDI r14, 0
LDI r9, 0
LDI r4, 256
LDI r1, 20
LDI r7, 0x2D0050
RECTF r14, r9, r4, r1, r7

; Title text
LDI r20, TEXT_BUF
STRO r20, "Recursive Self-Analysis"
LDI r14, 4
LDI r9, 4
LDI r4, TEXT_BUF
LDI r1, 0xFFFFFF
LDI r7, 0x2D0050
DRAWTEXT r14, r9, r4, r1, r7

; Draw 4 colored quadrants so there's something to detect
; Top-left: red block
LDI r14, 10
LDI r9, 30
LDI r4, 50
LDI r1, 50
LDI r7, 0xFF3333
RECTF r14, r9, r4, r1, r7

; Top-right: green block
LDI r14, 196
LDI r9, 30
LDI r4, 50
LDI r1, 50
LDI r7, 0x33FF33
RECTF r14, r9, r4, r1, r7

; Bottom-left: blue block
LDI r14, 10
LDI r9, 176
LDI r4, 50
LDI r1, 50
LDI r7, 0x3333FF
RECTF r14, r9, r4, r1, r7

; Bottom-right: yellow block
LDI r14, 196
LDI r9, 176
LDI r4, 50
LDI r1, 50
LDI r7, 0xFFFF33
RECTF r14, r9, r4, r1, r7

; Status line: "Sampling..."
LDI r20, TEXT_BUF
STRO r20, "Sampling screen..."
LDI r14, 4
LDI r9, 22
LDI r4, TEXT_BUF
LDI r1, 0xAAAAAA
LDI r7, 0x2D0050
DRAWTEXT r14, r9, r4, r1, r7

FRAME

; ── PHASE 2: Sample screen pixels ──
; Sample a 16x16 grid (every 16 pixels). For each quadrant,
; count non-background (non-0x0A0A14) pixels.

LDI r14, 1

; Quadrant counters: r1=TL, r7=TR, r13=BL, r0=BR
LDI r1, 0
LDI r7, 0
LDI r13, 0
LDI r0, 0

; r6 = row counter (0..15)
LDI r6, 0
sample_row:
    ; r11 = col counter (0..15)
    LDI r11, 0
sample_col:
    ; Compute actual pixel position: x = col*16, y = row*16
    MOV r3, r11
    SHLI r3, 4           ; x = col * 16
    MOV r8, r6
    SHLI r8, 4           ; y = row * 16

    ; Read pixel at (x, y)
    SCREENP r12, r3, r8  ; r12 = pixel color

    ; Check if pixel != background (0x0A0A14)
    LDI r10, 0x0A0A14
    CMP r12, r10
    JZ r2, sample_next    ; background pixel, skip

    ; Non-background pixel -- increment appropriate quadrant
    ; TL: x < 128 and y < 128
    CMPI r3, 128
    BGE r2, sample_check_right
    CMPI r8, 128
    BGE r2, sample_check_bl
    ADDI r1, 1            ; TL++
    JMP sample_next

sample_check_right:
    CMPI r8, 128
    BGE r2, sample_check_br
    ADDI r7, 1            ; TR++
    JMP sample_next

sample_check_bl:
    ADDI r13, 1            ; BL++
    JMP sample_next

sample_check_br:
    ADDI r0, 1            ; BR++
    ; fall through to sample_next

sample_next:
    ADDI r11, 1
    CMPI r11, 16
    JNZ r2, sample_col    ; more columns

    ADDI r6, 1
    CMPI r6, 16
    JNZ r2, sample_row    ; more rows

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
MOV r2, r1
CALL append_number
STRO r20, " pixels\n"
CALL advance_to_null

; Append TR count
STRO r20, "Top-right: "
CALL advance_to_null
MOV r2, r7
CALL append_number
STRO r20, " pixels\n"
CALL advance_to_null

; Append BL count
STRO r20, "Bottom-left: "
CALL advance_to_null
MOV r2, r13
CALL append_number
STRO r20, " pixels\n"
CALL advance_to_null

; Append BR count
STRO r20, "Bottom-right: "
CALL advance_to_null
MOV r2, r0
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
LDI r14, 4
LDI r9, 22
LDI r4, TEXT_BUF
LDI r1, 0xFFFF00
LDI r7, 0x2D0050
DRAWTEXT r14, r9, r4, r1, r7
FRAME

; ── PHASE 5: Call LLM ──
LDI r9, PROMPT_BUF
LDI r4, RESP_BUF
LDI r1, 512
LLM r9, r4, r1
; r2 = response length

; Save response length
MOV r5, r2

; ── PHASE 6: Display response on screen ──
LDI r20, TEXT_BUF
STRO r20, "LLM Response:"
LDI r14, 4
LDI r9, 80
LDI r4, TEXT_BUF
LDI r1, 0x00FF88
LDI r7, 0x0A0A14
DRAWTEXT r14, r9, r4, r1, r7

; Draw the LLM response text (first 32 chars fit on one line)
LDI r14, 4
LDI r9, 92
LDI r4, RESP_BUF
LDI r1, 0xDDDDDD
LDI r7, 0x0A0A14
DRAWTEXT r14, r9, r4, r1, r7

; ── PHASE 7: Write analysis to file ──
; Prepare file path
LDI r20, PATH_BUF
STRO r20, "/tmp/screen_analysis.txt"

; Open for writing
LDI r14, PATH_BUF
LDI r9, 1            ; mode = write
OPEN r14, r9
; r2 = fd

; Check for error
LDI r10, 0xFFFFFFFF
CMP r2, r10
JZ r2, write_failed

; Save fd
MOV r15, r2

; Write the response to file
MOV r14, r15          ; fd
LDI r9, RESP_BUF     ; buf addr
MOV r4, r5          ; length
WRITESTR r14, r9

; Close file
MOV r14, r15
CLOSE r14

; Show success
LDI r20, SUMMARY_BUF
STRO r20, "Analysis saved to /tmp/screen_analysis.txt"
LDI r14, 4
LDI r9, 140
LDI r4, SUMMARY_BUF
LDI r1, 0x33FF33
LDI r7, 0x0A0A14
DRAWTEXT r14, r9, r4, r1, r7
JMP show_counts

write_failed:
    LDI r20, SUMMARY_BUF
    STRO r20, "File write failed (no sandbox?)"
    LDI r14, 4
    LDI r9, 140
    LDI r4, SUMMARY_BUF
    LDI r1, 0xFF3333
    LDI r7, 0x0A0A14
    DRAWTEXT r14, r9, r4, r1, r7

show_counts:
    ; Show quadrant counts on screen
    LDI r20, SUMMARY_BUF
    STRO r20, "TL:"
    CALL advance_to_null
    MOV r2, r1
    CALL append_number
    STRO r20, " TR:"
    CALL advance_to_null
    MOV r2, r7
    CALL append_number
    STRO r20, " BL:"
    CALL advance_to_null
    MOV r2, r13
    CALL append_number
    STRO r20, " BR:"
    CALL advance_to_null
    MOV r2, r0
    CALL append_number

    LDI r14, 4
    LDI r9, 155
    LDI r4, SUMMARY_BUF
    LDI r1, 0xBBBBBB
    LDI r7, 0x0A0A14
    DRAWTEXT r14, r9, r4, r1, r7

; Final status
LDI r20, TEXT_BUF
STRO r20, "Self-analysis complete."
LDI r14, 4
LDI r9, 22
LDI r4, TEXT_BUF
LDI r1, 0x33FF33
LDI r7, 0x2D0050
DRAWTEXT r14, r9, r4, r1, r7
FRAME

; Halt
LDI r2, 0
EXIT r2

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
    JZ r2, advance_done
    ADDI r20, 1
    JMP advance_loop
advance_done:
    POP r22
    RET

; append_number -- append decimal number to string at r20
; r2: number to append (0-255)
; r20: current position (advanced past written digits)
append_number:
    PUSH r9
    PUSH r4
    PUSH r13
    PUSH r22

    ; Handle 0 special case
    CMPI r2, 0
    JNZ r2, append_nonzero
    LDI r22, 48           ; '0'
    STORE r20, r22
    ADDI r20, 1
    JMP append_done

append_nonzero:
    ; Extract digits into stack (reversed)
    LDI r13, 0             ; digit count
    MOV r9, r2            ; working copy
append_extract:
    CMPI r9, 0
    JZ r2, append_write
    ; r9 % 10
    MOV r4, r9
    LDI r22, 10
    DIV r4, r22           ; r4 = r9 / 10
    MUL r4, r22           ; r4 = (r9/10)*10
    SUB r9, r4            ; r9 = r9 % 10 (digit)
    ADDI r9, 48           ; ASCII digit
    PUSH r9               ; push digit onto stack
    ADDI r13, 1
    MOV r9, r2
    LDI r22, 10
    DIV r9, r22           ; r9 = r2 / 10
    MOV r2, r9            ; update r2 for next iteration
    MOV r9, r2
    JMP append_extract

append_write:
    ; Pop digits in correct order
    CMPI r13, 0
    JZ r2, append_done
    POP r22
    STORE r20, r22
    ADDI r20, 1
    SUBI r13, 1
    JMP append_write

append_done:
    LDI r22, 0
    STORE r20, r22        ; null terminate
    POP r22
    POP r13
    POP r4
    POP r9
    RET
