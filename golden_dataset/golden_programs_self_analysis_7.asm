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
LDI r5, 0x0A0A14
FILL r5

; Title bar (purple)
LDI r0, 0
LDI r3, 0
LDI r11, 256
LDI r6, 20
LDI r4, 0x2D0050
RECTF r0, r3, r11, r6, r4

; Title text
LDI r20, TEXT_BUF
STRO r20, "Recursive Self-Analysis"
LDI r0, 4
LDI r3, 4
LDI r11, TEXT_BUF
LDI r6, 0xFFFFFF
LDI r4, 0x2D0050
DRAWTEXT r0, r3, r11, r6, r4

; Draw 4 colored quadrants so there's something to detect
; Top-left: red block
LDI r0, 10
LDI r3, 30
LDI r11, 50
LDI r6, 50
LDI r4, 0xFF3333
RECTF r0, r3, r11, r6, r4

; Top-right: green block
LDI r0, 196
LDI r3, 30
LDI r11, 50
LDI r6, 50
LDI r4, 0x33FF33
RECTF r0, r3, r11, r6, r4

; Bottom-left: blue block
LDI r0, 10
LDI r3, 176
LDI r11, 50
LDI r6, 50
LDI r4, 0x3333FF
RECTF r0, r3, r11, r6, r4

; Bottom-right: yellow block
LDI r0, 196
LDI r3, 176
LDI r11, 50
LDI r6, 50
LDI r4, 0xFFFF33
RECTF r0, r3, r11, r6, r4

; Status line: "Sampling..."
LDI r20, TEXT_BUF
STRO r20, "Sampling screen..."
LDI r0, 4
LDI r3, 22
LDI r11, TEXT_BUF
LDI r6, 0xAAAAAA
LDI r4, 0x2D0050
DRAWTEXT r0, r3, r11, r6, r4

FRAME

; ── PHASE 2: Sample screen pixels ──
; Sample a 16x16 grid (every 16 pixels). For each quadrant,
; count non-background (non-0x0A0A14) pixels.

LDI r0, 1

; Quadrant counters: r6=TL, r4=TR, r2=BL, r8=BR
LDI r6, 0
LDI r4, 0
LDI r2, 0
LDI r8, 0

; r10 = row counter (0..15)
LDI r10, 0
sample_row:
    ; r12 = col counter (0..15)
    LDI r12, 0
sample_col:
    ; Compute actual pixel position: x = col*16, y = row*16
    MOV r7, r12
    SHLI r7, 4           ; x = col * 16
    MOV r14, r10
    SHLI r14, 4           ; y = row * 16

    ; Read pixel at (x, y)
    SCREENP r15, r7, r14  ; r15 = pixel color

    ; Check if pixel != background (0x0A0A14)
    LDI r9, 0x0A0A14
    CMP r15, r9
    JZ r5, sample_next    ; background pixel, skip

    ; Non-background pixel -- increment appropriate quadrant
    ; TL: x < 128 and y < 128
    CMPI r7, 128
    BGE r5, sample_check_right
    CMPI r14, 128
    BGE r5, sample_check_bl
    ADDI r6, 1            ; TL++
    JMP sample_next

sample_check_right:
    CMPI r14, 128
    BGE r5, sample_check_br
    ADDI r4, 1            ; TR++
    JMP sample_next

sample_check_bl:
    ADDI r2, 1            ; BL++
    JMP sample_next

sample_check_br:
    ADDI r8, 1            ; BR++
    ; fall through to sample_next

sample_next:
    ADDI r12, 1
    CMPI r12, 16
    JNZ r5, sample_col    ; more columns

    ADDI r10, 1
    CMPI r10, 16
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
MOV r5, r6
CALL append_number
STRO r20, " pixels\n"
CALL advance_to_null

; Append TR count
STRO r20, "Top-right: "
CALL advance_to_null
MOV r5, r4
CALL append_number
STRO r20, " pixels\n"
CALL advance_to_null

; Append BL count
STRO r20, "Bottom-left: "
CALL advance_to_null
MOV r5, r2
CALL append_number
STRO r20, " pixels\n"
CALL advance_to_null

; Append BR count
STRO r20, "Bottom-right: "
CALL advance_to_null
MOV r5, r8
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
LDI r3, 22
LDI r11, TEXT_BUF
LDI r6, 0xFFFF00
LDI r4, 0x2D0050
DRAWTEXT r0, r3, r11, r6, r4
FRAME

; ── PHASE 5: Call LLM ──
LDI r3, PROMPT_BUF
LDI r11, RESP_BUF
LDI r6, 512
LLM r3, r11, r6
; r5 = response length

; Save response length
MOV r1, r5

; ── PHASE 6: Display response on screen ──
LDI r20, TEXT_BUF
STRO r20, "LLM Response:"
LDI r0, 4
LDI r3, 80
LDI r11, TEXT_BUF
LDI r6, 0x00FF88
LDI r4, 0x0A0A14
DRAWTEXT r0, r3, r11, r6, r4

; Draw the LLM response text (first 32 chars fit on one line)
LDI r0, 4
LDI r3, 92
LDI r11, RESP_BUF
LDI r6, 0xDDDDDD
LDI r4, 0x0A0A14
DRAWTEXT r0, r3, r11, r6, r4

; ── PHASE 7: Write analysis to file ──
; Prepare file path
LDI r20, PATH_BUF
STRO r20, "/tmp/screen_analysis.txt"

; Open for writing
LDI r0, PATH_BUF
LDI r3, 1            ; mode = write
OPEN r0, r3
; r5 = fd

; Check for error
LDI r9, 0xFFFFFFFF
CMP r5, r9
JZ r5, write_failed

; Save fd
MOV r13, r5

; Write the response to file
MOV r0, r13          ; fd
LDI r3, RESP_BUF     ; buf addr
MOV r11, r1          ; length
WRITESTR r0, r3

; Close file
MOV r0, r13
CLOSE r0

; Show success
LDI r20, SUMMARY_BUF
STRO r20, "Analysis saved to /tmp/screen_analysis.txt"
LDI r0, 4
LDI r3, 140
LDI r11, SUMMARY_BUF
LDI r6, 0x33FF33
LDI r4, 0x0A0A14
DRAWTEXT r0, r3, r11, r6, r4
JMP show_counts

write_failed:
    LDI r20, SUMMARY_BUF
    STRO r20, "File write failed (no sandbox?)"
    LDI r0, 4
    LDI r3, 140
    LDI r11, SUMMARY_BUF
    LDI r6, 0xFF3333
    LDI r4, 0x0A0A14
    DRAWTEXT r0, r3, r11, r6, r4

show_counts:
    ; Show quadrant counts on screen
    LDI r20, SUMMARY_BUF
    STRO r20, "TL:"
    CALL advance_to_null
    MOV r5, r6
    CALL append_number
    STRO r20, " TR:"
    CALL advance_to_null
    MOV r5, r4
    CALL append_number
    STRO r20, " BL:"
    CALL advance_to_null
    MOV r5, r2
    CALL append_number
    STRO r20, " BR:"
    CALL advance_to_null
    MOV r5, r8
    CALL append_number

    LDI r0, 4
    LDI r3, 155
    LDI r11, SUMMARY_BUF
    LDI r6, 0xBBBBBB
    LDI r4, 0x0A0A14
    DRAWTEXT r0, r3, r11, r6, r4

; Final status
LDI r20, TEXT_BUF
STRO r20, "Self-analysis complete."
LDI r0, 4
LDI r3, 22
LDI r11, TEXT_BUF
LDI r6, 0x33FF33
LDI r4, 0x2D0050
DRAWTEXT r0, r3, r11, r6, r4
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
    PUSH r3
    PUSH r11
    PUSH r2
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
    LDI r2, 0             ; digit count
    MOV r3, r5            ; working copy
append_extract:
    CMPI r3, 0
    JZ r5, append_write
    ; r3 % 10
    MOV r11, r3
    LDI r22, 10
    DIV r11, r22           ; r11 = r3 / 10
    MUL r11, r22           ; r11 = (r3/10)*10
    SUB r3, r11            ; r3 = r3 % 10 (digit)
    ADDI r3, 48           ; ASCII digit
    PUSH r3               ; push digit onto stack
    ADDI r2, 1
    MOV r3, r5
    LDI r22, 10
    DIV r3, r22           ; r3 = r5 / 10
    MOV r5, r3            ; update r5 for next iteration
    MOV r3, r5
    JMP append_extract

append_write:
    ; Pop digits in correct order
    CMPI r2, 0
    JZ r5, append_done
    POP r22
    STORE r20, r22
    ADDI r20, 1
    SUBI r2, 1
    JMP append_write

append_done:
    LDI r22, 0
    STORE r20, r22        ; null terminate
    POP r22
    POP r2
    POP r11
    POP r3
    RET
