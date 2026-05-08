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
;   r10:  constant 1
;   r30: stack pointer

#define PROMPT_BUF  0x1400
#define RESP_BUF    0x1800
#define TEXT_BUF    0x2000
#define PATH_BUF    0x2100
#define SUMMARY_BUF 0x2200

LDI r10, 1
LDI r30, 0xFD00

; ── PHASE 1: Draw content on screen ──

; Dark background
LDI r11, 0x0A0A14
FILL r11

; Title bar (purple)
LDI r10, 0
LDI r8, 0
LDI r4, 256
LDI r15, 20
LDI r13, 0x2D0050
RECTF r10, r8, r4, r15, r13

; Title text
LDI r20, TEXT_BUF
STRO r20, "Recursive Self-Analysis"
LDI r10, 4
LDI r8, 4
LDI r4, TEXT_BUF
LDI r15, 0xFFFFFF
LDI r13, 0x2D0050
DRAWTEXT r10, r8, r4, r15, r13

; Draw 4 colored quadrants so there's something to detect
; Top-left: red block
LDI r10, 10
LDI r8, 30
LDI r4, 50
LDI r15, 50
LDI r13, 0xFF3333
RECTF r10, r8, r4, r15, r13

; Top-right: green block
LDI r10, 196
LDI r8, 30
LDI r4, 50
LDI r15, 50
LDI r13, 0x33FF33
RECTF r10, r8, r4, r15, r13

; Bottom-left: blue block
LDI r10, 10
LDI r8, 176
LDI r4, 50
LDI r15, 50
LDI r13, 0x3333FF
RECTF r10, r8, r4, r15, r13

; Bottom-right: yellow block
LDI r10, 196
LDI r8, 176
LDI r4, 50
LDI r15, 50
LDI r13, 0xFFFF33
RECTF r10, r8, r4, r15, r13

; Status line: "Sampling..."
LDI r20, TEXT_BUF
STRO r20, "Sampling screen..."
LDI r10, 4
LDI r8, 22
LDI r4, TEXT_BUF
LDI r15, 0xAAAAAA
LDI r13, 0x2D0050
DRAWTEXT r10, r8, r4, r15, r13

FRAME

; ── PHASE 2: Sample screen pixels ──
; Sample a 16x16 grid (every 16 pixels). For each quadrant,
; count non-background (non-0x0A0A14) pixels.

LDI r10, 1

; Quadrant counters: r15=TL, r13=TR, r9=BL, r6=BR
LDI r15, 0
LDI r13, 0
LDI r9, 0
LDI r6, 0

; r5 = row counter (0..15)
LDI r5, 0
sample_row:
    ; r14 = col counter (0..15)
    LDI r14, 0
sample_col:
    ; Compute actual pixel position: x = col*16, y = row*16
    MOV r12, r14
    SHLI r12, 4           ; x = col * 16
    MOV r3, r5
    SHLI r3, 4           ; y = row * 16

    ; Read pixel at (x, y)
    SCREENP r7, r12, r3  ; r7 = pixel color

    ; Check if pixel != background (0x0A0A14)
    LDI r2, 0x0A0A14
    CMP r7, r2
    JZ r11, sample_next    ; background pixel, skip

    ; Non-background pixel -- increment appropriate quadrant
    ; TL: x < 128 and y < 128
    CMPI r12, 128
    BGE r11, sample_check_right
    CMPI r3, 128
    BGE r11, sample_check_bl
    ADDI r15, 1            ; TL++
    JMP sample_next

sample_check_right:
    CMPI r3, 128
    BGE r11, sample_check_br
    ADDI r13, 1            ; TR++
    JMP sample_next

sample_check_bl:
    ADDI r9, 1            ; BL++
    JMP sample_next

sample_check_br:
    ADDI r6, 1            ; BR++
    ; fall through to sample_next

sample_next:
    ADDI r14, 1
    CMPI r14, 16
    JNZ r11, sample_col    ; more columns

    ADDI r5, 1
    CMPI r5, 16
    JNZ r11, sample_row    ; more rows

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
MOV r11, r15
CALL append_number
STRO r20, " pixels\n"
CALL advance_to_null

; Append TR count
STRO r20, "Top-right: "
CALL advance_to_null
MOV r11, r13
CALL append_number
STRO r20, " pixels\n"
CALL advance_to_null

; Append BL count
STRO r20, "Bottom-left: "
CALL advance_to_null
MOV r11, r9
CALL append_number
STRO r20, " pixels\n"
CALL advance_to_null

; Append BR count
STRO r20, "Bottom-right: "
CALL advance_to_null
MOV r11, r6
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
LDI r10, 4
LDI r8, 22
LDI r4, TEXT_BUF
LDI r15, 0xFFFF00
LDI r13, 0x2D0050
DRAWTEXT r10, r8, r4, r15, r13
FRAME

; ── PHASE 5: Call LLM ──
LDI r8, PROMPT_BUF
LDI r4, RESP_BUF
LDI r15, 512
LLM r8, r4, r15
; r11 = response length

; Save response length
MOV r0, r11

; ── PHASE 6: Display response on screen ──
LDI r20, TEXT_BUF
STRO r20, "LLM Response:"
LDI r10, 4
LDI r8, 80
LDI r4, TEXT_BUF
LDI r15, 0x00FF88
LDI r13, 0x0A0A14
DRAWTEXT r10, r8, r4, r15, r13

; Draw the LLM response text (first 32 chars fit on one line)
LDI r10, 4
LDI r8, 92
LDI r4, RESP_BUF
LDI r15, 0xDDDDDD
LDI r13, 0x0A0A14
DRAWTEXT r10, r8, r4, r15, r13

; ── PHASE 7: Write analysis to file ──
; Prepare file path
LDI r20, PATH_BUF
STRO r20, "/tmp/screen_analysis.txt"

; Open for writing
LDI r10, PATH_BUF
LDI r8, 1            ; mode = write
OPEN r10, r8
; r11 = fd

; Check for error
LDI r2, 0xFFFFFFFF
CMP r11, r2
JZ r11, write_failed

; Save fd
MOV r1, r11

; Write the response to file
MOV r10, r1          ; fd
LDI r8, RESP_BUF     ; buf addr
MOV r4, r0          ; length
WRITESTR r10, r8

; Close file
MOV r10, r1
CLOSE r10

; Show success
LDI r20, SUMMARY_BUF
STRO r20, "Analysis saved to /tmp/screen_analysis.txt"
LDI r10, 4
LDI r8, 140
LDI r4, SUMMARY_BUF
LDI r15, 0x33FF33
LDI r13, 0x0A0A14
DRAWTEXT r10, r8, r4, r15, r13
JMP show_counts

write_failed:
    LDI r20, SUMMARY_BUF
    STRO r20, "File write failed (no sandbox?)"
    LDI r10, 4
    LDI r8, 140
    LDI r4, SUMMARY_BUF
    LDI r15, 0xFF3333
    LDI r13, 0x0A0A14
    DRAWTEXT r10, r8, r4, r15, r13

show_counts:
    ; Show quadrant counts on screen
    LDI r20, SUMMARY_BUF
    STRO r20, "TL:"
    CALL advance_to_null
    MOV r11, r15
    CALL append_number
    STRO r20, " TR:"
    CALL advance_to_null
    MOV r11, r13
    CALL append_number
    STRO r20, " BL:"
    CALL advance_to_null
    MOV r11, r9
    CALL append_number
    STRO r20, " BR:"
    CALL advance_to_null
    MOV r11, r6
    CALL append_number

    LDI r10, 4
    LDI r8, 155
    LDI r4, SUMMARY_BUF
    LDI r15, 0xBBBBBB
    LDI r13, 0x0A0A14
    DRAWTEXT r10, r8, r4, r15, r13

; Final status
LDI r20, TEXT_BUF
STRO r20, "Self-analysis complete."
LDI r10, 4
LDI r8, 22
LDI r4, TEXT_BUF
LDI r15, 0x33FF33
LDI r13, 0x2D0050
DRAWTEXT r10, r8, r4, r15, r13
FRAME

; Halt
LDI r11, 0
EXIT r11

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
    JZ r11, advance_done
    ADDI r20, 1
    JMP advance_loop
advance_done:
    POP r22
    RET

; append_number -- append decimal number to string at r20
; r11: number to append (0-255)
; r20: current position (advanced past written digits)
append_number:
    PUSH r8
    PUSH r4
    PUSH r9
    PUSH r22

    ; Handle 0 special case
    CMPI r11, 0
    JNZ r11, append_nonzero
    LDI r22, 48           ; '0'
    STORE r20, r22
    ADDI r20, 1
    JMP append_done

append_nonzero:
    ; Extract digits into stack (reversed)
    LDI r9, 0             ; digit count
    MOV r8, r11            ; working copy
append_extract:
    CMPI r8, 0
    JZ r11, append_write
    ; r8 % 10
    MOV r4, r8
    LDI r22, 10
    DIV r4, r22           ; r4 = r8 / 10
    MUL r4, r22           ; r4 = (r8/10)*10
    SUB r8, r4            ; r8 = r8 % 10 (digit)
    ADDI r8, 48           ; ASCII digit
    PUSH r8               ; push digit onto stack
    ADDI r9, 1
    MOV r8, r11
    LDI r22, 10
    DIV r8, r22           ; r8 = r11 / 10
    MOV r11, r8            ; update r11 for next iteration
    MOV r8, r11
    JMP append_extract

append_write:
    ; Pop digits in correct order
    CMPI r9, 0
    JZ r11, append_done
    POP r22
    STORE r20, r22
    ADDI r20, 1
    SUBI r9, 1
    JMP append_write

append_done:
    LDI r22, 0
    STORE r20, r22        ; null terminate
    POP r22
    POP r9
    POP r4
    POP r8
    RET
