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
;   r9:  constant 1
;   r30: stack pointer

#define PROMPT_BUF  0x1400
#define RESP_BUF    0x1800
#define TEXT_BUF    0x2000
#define PATH_BUF    0x2100
#define SUMMARY_BUF 0x2200

LDI r9, 1
LDI r30, 0xFD00

; ── PHASE 1: Draw content on screen ──

; Dark background
LDI r5, 0x0A0A14
FILL r5

; Title bar (purple)
LDI r9, 0
LDI r0, 0
LDI r7, 256
LDI r2, 20
LDI r11, 0x2D0050
RECTF r9, r0, r7, r2, r11

; Title text
LDI r20, TEXT_BUF
STRO r20, "Recursive Self-Analysis"
LDI r9, 4
LDI r0, 4
LDI r7, TEXT_BUF
LDI r2, 0xFFFFFF
LDI r11, 0x2D0050
DRAWTEXT r9, r0, r7, r2, r11

; Draw 4 colored quadrants so there's something to detect
; Top-left: red block
LDI r9, 10
LDI r0, 30
LDI r7, 50
LDI r2, 50
LDI r11, 0xFF3333
RECTF r9, r0, r7, r2, r11

; Top-right: green block
LDI r9, 196
LDI r0, 30
LDI r7, 50
LDI r2, 50
LDI r11, 0x33FF33
RECTF r9, r0, r7, r2, r11

; Bottom-left: blue block
LDI r9, 10
LDI r0, 176
LDI r7, 50
LDI r2, 50
LDI r11, 0x3333FF
RECTF r9, r0, r7, r2, r11

; Bottom-right: yellow block
LDI r9, 196
LDI r0, 176
LDI r7, 50
LDI r2, 50
LDI r11, 0xFFFF33
RECTF r9, r0, r7, r2, r11

; Status line: "Sampling..."
LDI r20, TEXT_BUF
STRO r20, "Sampling screen..."
LDI r9, 4
LDI r0, 22
LDI r7, TEXT_BUF
LDI r2, 0xAAAAAA
LDI r11, 0x2D0050
DRAWTEXT r9, r0, r7, r2, r11

FRAME

; ── PHASE 2: Sample screen pixels ──
; Sample a 16x16 grid (every 16 pixels). For each quadrant,
; count non-background (non-0x0A0A14) pixels.

LDI r9, 1

; Quadrant counters: r2=TL, r11=TR, r12=BL, r4=BR
LDI r2, 0
LDI r11, 0
LDI r12, 0
LDI r4, 0

; r14 = row counter (0..15)
LDI r14, 0
sample_row:
    ; r13 = col counter (0..15)
    LDI r13, 0
sample_col:
    ; Compute actual pixel position: x = col*16, y = row*16
    MOV r1, r13
    SHLI r1, 4           ; x = col * 16
    MOV r8, r14
    SHLI r8, 4           ; y = row * 16

    ; Read pixel at (x, y)
    SCREENP r6, r1, r8  ; r6 = pixel color

    ; Check if pixel != background (0x0A0A14)
    LDI r10, 0x0A0A14
    CMP r6, r10
    JZ r5, sample_next    ; background pixel, skip

    ; Non-background pixel -- increment appropriate quadrant
    ; TL: x < 128 and y < 128
    CMPI r1, 128
    BGE r5, sample_check_right
    CMPI r8, 128
    BGE r5, sample_check_bl
    ADDI r2, 1            ; TL++
    JMP sample_next

sample_check_right:
    CMPI r8, 128
    BGE r5, sample_check_br
    ADDI r11, 1            ; TR++
    JMP sample_next

sample_check_bl:
    ADDI r12, 1            ; BL++
    JMP sample_next

sample_check_br:
    ADDI r4, 1            ; BR++
    ; fall through to sample_next

sample_next:
    ADDI r13, 1
    CMPI r13, 16
    JNZ r5, sample_col    ; more columns

    ADDI r14, 1
    CMPI r14, 16
    JNZ r5, sample_row    ; more rows

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
MOV r5, r2
CALL append_number
STRO r20, " pixels\n"
CALL advance_to_null

; Append TR count
STRO r20, "Top-right: "
CALL advance_to_null
MOV r5, r11
CALL append_number
STRO r20, " pixels\n"
CALL advance_to_null

; Append BL count
STRO r20, "Bottom-left: "
CALL advance_to_null
MOV r5, r12
CALL append_number
STRO r20, " pixels\n"
CALL advance_to_null

; Append BR count
STRO r20, "Bottom-right: "
CALL advance_to_null
MOV r5, r4
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
LDI r9, 4
LDI r0, 22
LDI r7, TEXT_BUF
LDI r2, 0xFFFF00
LDI r11, 0x2D0050
DRAWTEXT r9, r0, r7, r2, r11
FRAME

; ── PHASE 5: Call LLM ──
LDI r0, PROMPT_BUF
LDI r7, RESP_BUF
LDI r2, 512
LLM r0, r7, r2
; r5 = response length

; Save response length
MOV r3, r5

; ── PHASE 6: Display response on screen ──
LDI r20, TEXT_BUF
STRO r20, "LLM Response:"
LDI r9, 4
LDI r0, 80
LDI r7, TEXT_BUF
LDI r2, 0x00FF88
LDI r11, 0x0A0A14
DRAWTEXT r9, r0, r7, r2, r11

; Draw the LLM response text (first 32 chars fit on one line)
LDI r9, 4
LDI r0, 92
LDI r7, RESP_BUF
LDI r2, 0xDDDDDD
LDI r11, 0x0A0A14
DRAWTEXT r9, r0, r7, r2, r11

; ── PHASE 7: Write analysis to file ──
; Prepare file path
LDI r20, PATH_BUF
STRO r20, "/tmp/screen_analysis.txt"

; Open for writing
LDI r9, PATH_BUF
LDI r0, 1            ; mode = write
OPEN r9, r0
; r5 = fd

; Check for error
LDI r10, 0xFFFFFFFF
CMP r5, r10
JZ r5, write_failed

; Save fd
MOV r15, r5

; Write the response to file
MOV r9, r15          ; fd
LDI r0, RESP_BUF     ; buf addr
MOV r7, r3          ; length
WRITESTR r9, r0

; Close file
MOV r9, r15
CLOSE r9

; Show success
LDI r20, SUMMARY_BUF
STRO r20, "Analysis saved to /tmp/screen_analysis.txt"
LDI r9, 4
LDI r0, 140
LDI r7, SUMMARY_BUF
LDI r2, 0x33FF33
LDI r11, 0x0A0A14
DRAWTEXT r9, r0, r7, r2, r11
JMP show_counts

write_failed:
    LDI r20, SUMMARY_BUF
    STRO r20, "File write failed (no sandbox?)"
    LDI r9, 4
    LDI r0, 140
    LDI r7, SUMMARY_BUF
    LDI r2, 0xFF3333
    LDI r11, 0x0A0A14
    DRAWTEXT r9, r0, r7, r2, r11

show_counts:
    ; Show quadrant counts on screen
    LDI r20, SUMMARY_BUF
    STRO r20, "TL:"
    CALL advance_to_null
    MOV r5, r2
    CALL append_number
    STRO r20, " TR:"
    CALL advance_to_null
    MOV r5, r11
    CALL append_number
    STRO r20, " BL:"
    CALL advance_to_null
    MOV r5, r12
    CALL append_number
    STRO r20, " BR:"
    CALL advance_to_null
    MOV r5, r4
    CALL append_number

    LDI r9, 4
    LDI r0, 155
    LDI r7, SUMMARY_BUF
    LDI r2, 0xBBBBBB
    LDI r11, 0x0A0A14
    DRAWTEXT r9, r0, r7, r2, r11

; Final status
LDI r20, TEXT_BUF
STRO r20, "Self-analysis complete."
LDI r9, 4
LDI r0, 22
LDI r7, TEXT_BUF
LDI r2, 0x33FF33
LDI r11, 0x2D0050
DRAWTEXT r9, r0, r7, r2, r11
FRAME

; Halt
LDI r5, 0
EXIT r5

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
    JZ r5, advance_done
    ADDI r20, 1
    JMP advance_loop
advance_done:
    POP r22
    RET

; append_number -- append decimal number to string at r20
; r5: number to append (0-255)
; r20: current position (advanced past written digits)
append_number:
    PUSH r0
    PUSH r7
    PUSH r12
    PUSH r22

    ; Handle 0 special case
    CMPI r5, 0
    JNZ r5, append_nonzero
    LDI r22, 48           ; '0'
    STORE r20, r22
    ADDI r20, 1
    JMP append_done

append_nonzero:
    ; Extract digits into stack (reversed)
    LDI r12, 0             ; digit count
    MOV r0, r5            ; working copy
append_extract:
    CMPI r0, 0
    JZ r5, append_write
    ; r0 % 10
    MOV r7, r0
    LDI r22, 10
    DIV r7, r22           ; r7 = r0 / 10
    MUL r7, r22           ; r7 = (r0/10)*10
    SUB r0, r7            ; r0 = r0 % 10 (digit)
    ADDI r0, 48           ; ASCII digit
    PUSH r0               ; push digit onto stack
    ADDI r12, 1
    MOV r0, r5
    LDI r22, 10
    DIV r0, r22           ; r0 = r5 / 10
    MOV r5, r0            ; update r5 for next iteration
    MOV r0, r5
    JMP append_extract

append_write:
    ; Pop digits in correct order
    CMPI r12, 0
    JZ r5, append_done
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
    POP r7
    POP r0
    RET
