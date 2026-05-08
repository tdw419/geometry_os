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
;   r6:  constant 1
;   r30: stack pointer

#define PROMPT_BUF  0x1400
#define RESP_BUF    0x1800
#define TEXT_BUF    0x2000
#define PATH_BUF    0x2100
#define SUMMARY_BUF 0x2200

LDI r6, 1
LDI r30, 0xFD00

; ── PHASE 1: Draw content on screen ──

; Dark background
LDI r2, 0x0A0A14
FILL r2

; Title bar (purple)
LDI r6, 0
LDI r10, 0
LDI r11, 256
LDI r4, 20
LDI r14, 0x2D0050
RECTF r6, r10, r11, r4, r14

; Title text
LDI r20, TEXT_BUF
STRO r20, "Recursive Self-Analysis"
LDI r6, 4
LDI r10, 4
LDI r11, TEXT_BUF
LDI r4, 0xFFFFFF
LDI r14, 0x2D0050
DRAWTEXT r6, r10, r11, r4, r14

; Draw 4 colored quadrants so there's something to detect
; Top-left: red block
LDI r6, 10
LDI r10, 30
LDI r11, 50
LDI r4, 50
LDI r14, 0xFF3333
RECTF r6, r10, r11, r4, r14

; Top-right: green block
LDI r6, 196
LDI r10, 30
LDI r11, 50
LDI r4, 50
LDI r14, 0x33FF33
RECTF r6, r10, r11, r4, r14

; Bottom-left: blue block
LDI r6, 10
LDI r10, 176
LDI r11, 50
LDI r4, 50
LDI r14, 0x3333FF
RECTF r6, r10, r11, r4, r14

; Bottom-right: yellow block
LDI r6, 196
LDI r10, 176
LDI r11, 50
LDI r4, 50
LDI r14, 0xFFFF33
RECTF r6, r10, r11, r4, r14

; Status line: "Sampling..."
LDI r20, TEXT_BUF
STRO r20, "Sampling screen..."
LDI r6, 4
LDI r10, 22
LDI r11, TEXT_BUF
LDI r4, 0xAAAAAA
LDI r14, 0x2D0050
DRAWTEXT r6, r10, r11, r4, r14

FRAME

; ── PHASE 2: Sample screen pixels ──
; Sample a 16x16 grid (every 16 pixels). For each quadrant,
; count non-background (non-0x0A0A14) pixels.

LDI r6, 1

; Quadrant counters: r4=TL, r14=TR, r12=BL, r1=BR
LDI r4, 0
LDI r14, 0
LDI r12, 0
LDI r1, 0

; r15 = row counter (0..15)
LDI r15, 0
sample_row:
    ; r5 = col counter (0..15)
    LDI r5, 0
sample_col:
    ; Compute actual pixel position: x = col*16, y = row*16
    MOV r8, r5
    SHLI r8, 4           ; x = col * 16
    MOV r0, r15
    SHLI r0, 4           ; y = row * 16

    ; Read pixel at (x, y)
    SCREENP r3, r8, r0  ; r3 = pixel color

    ; Check if pixel != background (0x0A0A14)
    LDI r7, 0x0A0A14
    CMP r3, r7
    JZ r2, sample_next    ; background pixel, skip

    ; Non-background pixel -- increment appropriate quadrant
    ; TL: x < 128 and y < 128
    CMPI r8, 128
    BGE r2, sample_check_right
    CMPI r0, 128
    BGE r2, sample_check_bl
    ADDI r4, 1            ; TL++
    JMP sample_next

sample_check_right:
    CMPI r0, 128
    BGE r2, sample_check_br
    ADDI r14, 1            ; TR++
    JMP sample_next

sample_check_bl:
    ADDI r12, 1            ; BL++
    JMP sample_next

sample_check_br:
    ADDI r1, 1            ; BR++
    ; fall through to sample_next

sample_next:
    ADDI r5, 1
    CMPI r5, 16
    JNZ r2, sample_col    ; more columns

    ADDI r15, 1
    CMPI r15, 16
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
MOV r2, r4
CALL append_number
STRO r20, " pixels\n"
CALL advance_to_null

; Append TR count
STRO r20, "Top-right: "
CALL advance_to_null
MOV r2, r14
CALL append_number
STRO r20, " pixels\n"
CALL advance_to_null

; Append BL count
STRO r20, "Bottom-left: "
CALL advance_to_null
MOV r2, r12
CALL append_number
STRO r20, " pixels\n"
CALL advance_to_null

; Append BR count
STRO r20, "Bottom-right: "
CALL advance_to_null
MOV r2, r1
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
LDI r6, 4
LDI r10, 22
LDI r11, TEXT_BUF
LDI r4, 0xFFFF00
LDI r14, 0x2D0050
DRAWTEXT r6, r10, r11, r4, r14
FRAME

; ── PHASE 5: Call LLM ──
LDI r10, PROMPT_BUF
LDI r11, RESP_BUF
LDI r4, 512
LLM r10, r11, r4
; r2 = response length

; Save response length
MOV r13, r2

; ── PHASE 6: Display response on screen ──
LDI r20, TEXT_BUF
STRO r20, "LLM Response:"
LDI r6, 4
LDI r10, 80
LDI r11, TEXT_BUF
LDI r4, 0x00FF88
LDI r14, 0x0A0A14
DRAWTEXT r6, r10, r11, r4, r14

; Draw the LLM response text (first 32 chars fit on one line)
LDI r6, 4
LDI r10, 92
LDI r11, RESP_BUF
LDI r4, 0xDDDDDD
LDI r14, 0x0A0A14
DRAWTEXT r6, r10, r11, r4, r14

; ── PHASE 7: Write analysis to file ──
; Prepare file path
LDI r20, PATH_BUF
STRO r20, "/tmp/screen_analysis.txt"

; Open for writing
LDI r6, PATH_BUF
LDI r10, 1            ; mode = write
OPEN r6, r10
; r2 = fd

; Check for error
LDI r7, 0xFFFFFFFF
CMP r2, r7
JZ r2, write_failed

; Save fd
MOV r9, r2

; Write the response to file
MOV r6, r9          ; fd
LDI r10, RESP_BUF     ; buf addr
MOV r11, r13          ; length
WRITESTR r6, r10

; Close file
MOV r6, r9
CLOSE r6

; Show success
LDI r20, SUMMARY_BUF
STRO r20, "Analysis saved to /tmp/screen_analysis.txt"
LDI r6, 4
LDI r10, 140
LDI r11, SUMMARY_BUF
LDI r4, 0x33FF33
LDI r14, 0x0A0A14
DRAWTEXT r6, r10, r11, r4, r14
JMP show_counts

write_failed:
    LDI r20, SUMMARY_BUF
    STRO r20, "File write failed (no sandbox?)"
    LDI r6, 4
    LDI r10, 140
    LDI r11, SUMMARY_BUF
    LDI r4, 0xFF3333
    LDI r14, 0x0A0A14
    DRAWTEXT r6, r10, r11, r4, r14

show_counts:
    ; Show quadrant counts on screen
    LDI r20, SUMMARY_BUF
    STRO r20, "TL:"
    CALL advance_to_null
    MOV r2, r4
    CALL append_number
    STRO r20, " TR:"
    CALL advance_to_null
    MOV r2, r14
    CALL append_number
    STRO r20, " BL:"
    CALL advance_to_null
    MOV r2, r12
    CALL append_number
    STRO r20, " BR:"
    CALL advance_to_null
    MOV r2, r1
    CALL append_number

    LDI r6, 4
    LDI r10, 155
    LDI r11, SUMMARY_BUF
    LDI r4, 0xBBBBBB
    LDI r14, 0x0A0A14
    DRAWTEXT r6, r10, r11, r4, r14

; Final status
LDI r20, TEXT_BUF
STRO r20, "Self-analysis complete."
LDI r6, 4
LDI r10, 22
LDI r11, TEXT_BUF
LDI r4, 0x33FF33
LDI r14, 0x2D0050
DRAWTEXT r6, r10, r11, r4, r14
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
    PUSH r10
    PUSH r11
    PUSH r12
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
    LDI r12, 0             ; digit count
    MOV r10, r2            ; working copy
append_extract:
    CMPI r10, 0
    JZ r2, append_write
    ; r10 % 10
    MOV r11, r10
    LDI r22, 10
    DIV r11, r22           ; r11 = r10 / 10
    MUL r11, r22           ; r11 = (r10/10)*10
    SUB r10, r11            ; r10 = r10 % 10 (digit)
    ADDI r10, 48           ; ASCII digit
    PUSH r10               ; push digit onto stack
    ADDI r12, 1
    MOV r10, r2
    LDI r22, 10
    DIV r10, r22           ; r10 = r2 / 10
    MOV r2, r10            ; update r2 for next iteration
    MOV r10, r2
    JMP append_extract

append_write:
    ; Pop digits in correct order
    CMPI r12, 0
    JZ r2, append_done
    POP r22
    STORE r20, r22
    ADDI r20, 1
    SUBI r12, 1
    JMP append_write

append_done:
    LDI r22, 0
    STORE r20, r22        ; null terminate
    POP r22
    POP r12
    POP r11
    POP r10
    RET
