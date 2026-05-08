; DESCRIPTION: Geometry OS program to draw a colored object.

; hex_viewer.asm -- Interactive Hex Viewer for Geometry OS
;
; Phase 120: File content viewer and hex editor
; Reads VFS files via OPEN/READ/CLOSE, displays as hex dump with ASCII.
; UP/DOWN arrows scroll through file content. ENTER to open. ESC to go back.
;
; RAM Layout (above bytecode ~0x700, using 0x700+):
;   0x700-0x71F  filename address table (16 entries)
;   0x800       mode (0=list, 1=hexview)
;   0x804       file count
;   0x806       selected index
;   0x808       scroll offset (bytes)
;   0x80A       file size (bytes)
;   0x80C       temp fd
;   0x900-0xBFF  file list buffer (from LS)
;   0xC00-0x1FFF file content buffer (up to 5120 bytes)
;   0x2000-0x20FF string work buffer
;   0x2100-0x210F hex nibble lookup table
;
; NOTE: No colons in comments (assembler pitfall)

#define FNAME_TABLE  0x700
#define MODE         0x800
#define FILE_COUNT   0x804
#define SEL_INDEX    0x806
#define SCROLL_OFF   0x808
#define FILE_SIZE    0x80A
#define TEMP_FD      0x80C
#define FILE_BUF     0x900
#define CONTENT_BUF  0xC00
#define STR_BUF      0x2000
#define HEX_TABLE    0x2100
#define TITLE_Y      6
#define ROW_BASE_Y   28
#define ROW_H        14
#define HEX_START_Y  30
#define BYTES_PER_ROW 16
#define MAX_VISIBLE  14

; ── INIT ──────────────────────────────────────
LDI r4, 1

; Build hex nibble lookup table at HEX_TABLE
; HEX_TABLE[0..15] = '0','1',...,'9','A','B','C','D','E','F'
LDI r20, HEX_TABLE
LDI r17, 48           ; '0'
STORE r20, r17
ADDI r20, 1
LDI r17, 49
STORE r20, r17
ADDI r20, 1
LDI r17, 50
STORE r20, r17
ADDI r20, 1
LDI r17, 51
STORE r20, r17
ADDI r20, 1
LDI r17, 52
STORE r20, r17
ADDI r20, 1
LDI r17, 53
STORE r20, r17
ADDI r20, 1
LDI r17, 54
STORE r20, r17
ADDI r20, 1
LDI r17, 55
STORE r20, r17
ADDI r20, 1
LDI r17, 56
STORE r20, r17
ADDI r20, 1
LDI r17, 57           ; '9'
STORE r20, r17
ADDI r20, 1
LDI r17, 65           ; 'A'
STORE r20, r17
ADDI r20, 1
LDI r17, 66           ; 'B'
STORE r20, r17
ADDI r20, 1
LDI r17, 67           ; 'C'
STORE r20, r17
ADDI r20, 1
LDI r17, 68           ; 'D'
STORE r20, r17
ADDI r20, 1
LDI r17, 69           ; 'E'
STORE r20, r17
ADDI r20, 1
LDI r17, 70           ; 'F'
STORE r20, r17

; Fill screen dark background
LDI r10, 0x0d1117
FILL r10

; Mode = list view
LDI r20, MODE
LDI r10, 0
STORE r20, r10

; Selected index = 0
LDI r20, SEL_INDEX
LDI r10, 0
STORE r20, r10

; Scroll offset = 0
LDI r20, SCROLL_OFF
LDI r10, 0
STORE r20, r10

; File size = 0
LDI r20, FILE_SIZE
LDI r10, 0
STORE r20, r10

; ── List files with LS ──
LDI r20, FILE_BUF
LS r20
; r15 = file count
LDI r21, FILE_COUNT
STORE r21, r15

; ── Parse LS buffer: build filename address table ──
LDI r20, FILE_BUF
LDI r22, 0
LDI r23, FNAME_TABLE

scan_loop:
    LDI r14, 16
    CMP r22, r14
    BGE r15, scan_done

    LOAD r10, r20
    CMPI r10, 0
    JZ r15, scan_done

    STORE r23, r20
    ADDI r23, 1

skip_chars:
    LOAD r10, r20
    CMPI r10, 0
    JZ r15, next_entry
    ADDI r20, 1
    JMP skip_chars

next_entry:
    ADDI r20, 1
    ADDI r22, 1
    JMP scan_loop

scan_done:

; ── Store static strings ──
LDI r20, STR_BUF
STRO r20, "HEX VIEWER"

LDI r20, STR_BUF
ADDI r20, 32
STRO r20, "FILES"

LDI r20, STR_BUF
ADDI r20, 64
STRO r20, "UP/DOWN scroll"

LDI r20, STR_BUF
ADDI r20, 96
STRO r20, "ENTER open"

LDI r20, STR_BUF
ADDI r20, 128
STRO r20, "ESC back"

; ── MAIN LOOP ─────────────────────────────────
main_loop:
    LDI r4, 1

    LDI r20, MODE
    LOAD r14, r20
    CMPI r14, 0
    JZ r15, draw_list_view

    JMP draw_hex_view

; ── LIST VIEW ─────────────────────────────────
draw_list_view:
    LDI r10, 0x0d1117
    FILL r10

    ; Title bar
    LDI r4, 0
    LDI r10, 0
    LDI r12, 256
    LDI r9, 22
    LDI r13, 0x1a1f29
    RECTF r4, r10, r12, r9, r13

    ; Title text
    LDI r4, 8
    LDI r10, TITLE_Y
    LDI r12, STR_BUF
    TEXT r4, r10, r12

    ; File count
    LDI r20, FILE_COUNT
    LOAD r10, r20
    LDI r20, STR_BUF
    ADDI r20, 160
    LDI r14, 48
    ADD r14, r10
    STORE r20, r14
    LDI r14, 0
    ADDI r20, 1
    STORE r20, r14
    LDI r4, 200
    LDI r10, TITLE_Y
    LDI r12, STR_BUF
    ADDI r12, 160
    TEXT r4, r10, r12

    ; Instructions
    LDI r4, 8
    LDI r10, 238
    LDI r12, STR_BUF
    ADDI r12, 64
    LDI r6, 0x888899
    LDI r11, 0x0d1117
    DRAWTEXT r4, r10, r12, r6, r11

    ; Draw file rows with selection highlight
    LDI r22, 0
    LDI r23, FNAME_TABLE
    LDI r24, ROW_BASE_Y

draw_rows:
    LDI r14, 16
    CMP r22, r14
    BGE r15, list_input

    LOAD r20, r23
    CMPI r20, 0
    JZ r15, list_input

    ; Check if selected
    LDI r25, SEL_INDEX
    LOAD r25, r25
    CMP r22, r25
    JZ r15, row_selected

    ; Normal row
    LDI r4, 4
    MOV r10, r24
    LDI r12, 248
    LDI r9, ROW_H
    LDI r13, 0x131820
    RECTF r4, r10, r12, r9, r13
    JMP draw_fname

row_selected:
    LDI r4, 4
    MOV r10, r24
    LDI r12, 248
    LDI r9, ROW_H
    LDI r13, 0x1a3a5c
    RECTF r4, r10, r12, r9, r13

    ; Arrow indicator
    LDI r20, STR_BUF
    ADDI r20, 192
    STRO r20, ">"

draw_fname:
    LDI r4, 16
    MOV r10, r24
    ADDI r10, 2
    TEXT r4, r10, r20

    ADDI r22, 1
    ADDI r23, 1
    LDI r14, ROW_H
    ADD r24, r14
    JMP draw_rows

; ── LIST INPUT ────────────────────────────────
list_input:
    FRAME

    IKEY r3
    CMPI r3, 0
    JZ r15, main_loop

    ; W = 87 (up)
    CMPI r3, 87
    JNZ r15, not_up
    LDI r20, SEL_INDEX
    LOAD r25, r20
    CMPI r25, 0
    JZ r15, main_loop
    SUBI r25, 1
    STORE r20, r25
    JMP main_loop

not_up:
    ; S = 83 (down)
    CMPI r3, 83
    JNZ r15, not_down
    LDI r20, SEL_INDEX
    LOAD r25, r20
    LDI r14, FILE_COUNT
    LOAD r14, r14
    SUBI r14, 1
    CMP r25, r14
    BGE r15, main_loop
    ADDI r25, 1
    STORE r20, r25
    JMP main_loop

not_down:
    ; ENTER = 10 or 13
    CMPI r3, 10
    JZ r15, open_selected
    CMPI r3, 13
    JZ r15, open_selected
    JMP main_loop

; ── OPEN SELECTED FILE ────────────────────────
open_selected:
    LDI r23, SEL_INDEX
    LOAD r22, r23
    LDI r23, FNAME_TABLE
    ADD r23, r22
    LOAD r20, r23
    CMPI r20, 0
    JZ r15, main_loop

    ; Reset scroll
    LDI r25, SCROLL_OFF
    LDI r14, 0
    STORE r25, r14

    ; Open
    LDI r14, 0
    OPEN r20, r14
    MOV r19, r15
    CMPI r19, 0xFFFFFFFF
    JZ r15, main_loop

    LDI r21, TEMP_FD
    STORE r21, r19

    ; Read content
    LDI r14, CONTENT_BUF
    LDI r2, 5120
    READ r19, r14, r2
    LDI r21, FILE_SIZE
    STORE r21, r15

    ; Null-terminate
    LDI r20, CONTENT_BUF
    ADD r20, r15
    LDI r10, 0
    STORE r20, r10

    CLOSE r19

    ; Switch to hex view
    LDI r20, MODE
    LDI r10, 1
    STORE r20, r10
    JMP main_loop

; ── HEX VIEW ─────────────────────────────────
draw_hex_view:
    LDI r10, 0x0d1117
    FILL r10

    ; Header bar
    LDI r4, 0
    LDI r10, 0
    LDI r12, 256
    LDI r9, 22
    LDI r13, 0x1a1f29
    RECTF r4, r10, r12, r9, r13

    ; Title
    LDI r4, 8
    LDI r10, TITLE_Y
    LDI r12, STR_BUF
    TEXT r4, r10, r12

    ; Separator line
    LDI r4, 0
    LDI r10, 26
    LDI r12, 256
    LDI r9, 1
    LDI r13, 0x2a3a4a
    RECTF r4, r10, r12, r9, r13

    ; Draw hex dump rows
    LDI r22, 0            ; row counter
    LDI r27, SCROLL_OFF
    LOAD r27, r27         ; byte offset

hex_row_loop:
    LDI r14, MAX_VISIBLE
    CMP r22, r14
    BGE r15, hex_footer

    ; Compute byte offset for this row
    MOV r28, r22
    LDI r14, BYTES_PER_ROW
    MUL r28, r14
    ADD r28, r27

    ; Check past EOF
    LDI r14, FILE_SIZE
    LOAD r14, r14
    CMP r28, r14
    BGE r15, hex_footer

    ; Y position for this row
    MOV r8, r22
    LDI r14, 14
    MUL r8, r14
    ADDI r8, 28

    ; ── Draw address offset ──
    ; Convert r28 to 4-hex-char string using lookup table
    ; High nibble of high byte
    LDI r21, STR_BUF
    ADDI r21, 192       ; offset string destination

    MOV r10, r28
    LDI r12, 12
    SHR r10, r12
    LDI r12, 0xF
    AND r10, r12
    LDI r12, HEX_TABLE
    ADD r12, r10
    LOAD r9, r12
    STORE r21, r9
    ADDI r21, 1

    ; Nibble 2 (bits 8-11)
    MOV r10, r28
    LDI r12, 8
    SHR r10, r12
    LDI r12, 0xF
    AND r10, r12
    LDI r12, HEX_TABLE
    ADD r12, r10
    LOAD r9, r12
    STORE r21, r9
    ADDI r21, 1

    ; Nibble 1 (bits 4-7)
    MOV r10, r28
    LDI r12, 4
    SHR r10, r12
    LDI r12, 0xF
    AND r10, r12
    LDI r12, HEX_TABLE
    ADD r12, r10
    LOAD r9, r12
    STORE r21, r9
    ADDI r21, 1

    ; Nibble 0 (bits 0-3)
    MOV r10, r28
    LDI r12, 0xF
    AND r10, r12
    LDI r12, HEX_TABLE
    ADD r12, r10
    LOAD r9, r12
    STORE r21, r9
    ADDI r21, 1

    ; Null terminate
    LDI r9, 0
    STORE r21, r9

    ; Draw address
    LDI r3, 4
    LDI r1, STR_BUF
    ADDI r1, 192
    LDI r6, 0x55aaff
    LDI r11, 0x0d1117
    DRAWTEXT r3, r8, r1, r6, r11

    ; ── Draw hex bytes ──
    LDI r29, 0           ; byte counter in row
    LDI r30, 48           ; x start for hex data

hex_byte_loop:
    LDI r14, BYTES_PER_ROW
    CMP r29, r14
    BGE r15, draw_ascii

    ; Check past EOF
    MOV r14, r28
    ADD r14, r29
    LDI r2, FILE_SIZE
    LOAD r2, r2
    CMP r14, r2
    BGE r15, draw_ascii

    ; Load byte
    LDI r14, CONTENT_BUF
    ADD r14, r28
    ADD r14, r29
    LOAD r10, r14

    ; Convert byte to 2 hex chars using lookup table
    LDI r21, STR_BUF
    ADDI r21, 208

    ; High nibble
    MOV r12, r10
    LDI r9, 4
    SHR r12, r9
    LDI r9, 0xF
    AND r12, r9
    LDI r9, HEX_TABLE
    ADD r9, r12
    LOAD r13, r9
    STORE r21, r13
    ADDI r21, 1

    ; Low nibble
    LDI r9, 0xF
    AND r10, r9
    LDI r9, HEX_TABLE
    ADD r9, r10
    LOAD r13, r9
    STORE r21, r13
    ADDI r21, 1

    ; Null terminate
    LDI r13, 0
    STORE r21, r13

    ; Draw hex pair
    MOV r3, r30
    LDI r1, STR_BUF
    ADDI r1, 208
    LDI r6, 0x44dd88
    LDI r11, 0x0d1117
    DRAWTEXT r3, r8, r1, r6, r11

    ADDI r30, 20

    ; Extra gap after 8 bytes
    LDI r14, 8
    CMP r29, r14
    JNZ r15, no_gap
    ADDI r30, 8
no_gap:
    ADDI r29, 1
    JMP hex_byte_loop

draw_ascii:
    ; Draw ASCII representation on right
    LDI r29, 0
    LDI r30, 218           ; x start for ASCII
ascii_loop:
    LDI r14, BYTES_PER_ROW
    CMP r29, r14
    BGE r15, hex_next_row

    MOV r14, r28
    ADD r14, r29
    LDI r2, FILE_SIZE
    LOAD r2, r2
    CMP r14, r2
    BGE r15, hex_next_row

    ; Load byte
    LDI r14, CONTENT_BUF
    ADD r14, r28
    ADD r14, r29
    LOAD r10, r14

    ; Printable check (32-126)
    CMPI r10, 32
    BLT r15, ascii_dot
    CMPI r10, 127
    BGE r15, ascii_dot
    ; Store char
    LDI r21, STR_BUF
    ADDI r21, 224
    STORE r21, r10
    LDI r14, 0
    ADDI r21, 1
    STORE r21, r14
    JMP ascii_draw

ascii_dot:
    LDI r21, STR_BUF
    ADDI r21, 224
    LDI r14, 46
    STORE r21, r14
    LDI r14, 0
    ADDI r21, 1
    STORE r21, r14

ascii_draw:
    MOV r3, r30
    LDI r1, STR_BUF
    ADDI r1, 224
    LDI r6, 0x889999
    LDI r11, 0x0d1117
    DRAWTEXT r3, r8, r1, r6, r11

    ADDI r30, 8
    ADDI r29, 1
    JMP ascii_loop

hex_next_row:
    ADDI r22, 1
    JMP hex_row_loop

; ── HEX FOOTER ────────────────────────────────
hex_footer:
    ; Footer bar
    LDI r4, 0
    LDI r10, 236
    LDI r12, 256
    LDI r9, 20
    LDI r13, 0x1a1f29
    RECTF r4, r10, r12, r9, r13

    ; Show file size
    LDI r20, STR_BUF
    ADDI r20, 240
    STRO r20, "Bytes:"

    ; File size as decimal
    LDI r14, FILE_SIZE
    LOAD r10, r14
    LDI r20, STR_BUF
    ADDI r20, 256

    ; Quick decimal conversion (up to 5 digits)
    LDI r2, 1
    LDI r12, 10000
    MOV r9, r10
    DIV r9, r12
    CMPI r9, 0
    JZ r15, skip10k
    ADDI r9, 48
    STORE r20, r9
    ADD r20, r2
    MOV r9, r10
    MOD r9, r12
    MOV r10, r9
skip10k:
    LDI r12, 1000
    MOV r9, r10
    DIV r9, r12
    CMPI r9, 0
    JZ r15, skip1k
    ADDI r9, 48
    STORE r20, r9
    ADD r20, r2
    MOV r9, r10
    MOD r9, r12
    MOV r10, r9
skip1k:
    LDI r12, 100
    MOV r9, r10
    DIV r9, r12
    CMPI r9, 0
    JZ r15, skip100
    ADDI r9, 48
    STORE r20, r9
    ADD r20, r2
    MOV r9, r10
    MOD r9, r12
    MOV r10, r9
skip100:
    LDI r12, 10
    MOV r9, r10
    DIV r9, r12
    ADDI r9, 48
    STORE r20, r9
    ADD r20, r2
    MOD r10, r12
    ADDI r10, 48
    STORE r20, r10
    ADD r20, r2
    LDI r10, 0
    STORE r20, r10

    ; Draw "Bytes: N"
    LDI r3, 4
    LDI r8, 240
    LDI r1, STR_BUF
    ADDI r1, 240
    LDI r6, 0xaaaaaa
    LDI r11, 0x1a1f29
    DRAWTEXT r3, r8, r1, r6, r11

    ; Scroll hint
    LDI r4, 110
    LDI r10, 240
    LDI r12, STR_BUF
    ADDI r12, 64
    DRAWTEXT r4, r10, r12, r6, r11

    ; ESC hint
    LDI r4, 190
    LDI r10, 240
    LDI r12, STR_BUF
    ADDI r12, 128
    DRAWTEXT r4, r10, r12, r6, r11

; ── HEX INPUT ─────────────────────────────────
hex_input:
    FRAME

    IKEY r3
    CMPI r3, 0
    JZ r15, main_loop

    ; ESC = 27 -- back to list
    CMPI r3, 27
    JNZ r15, not_esc
    LDI r20, MODE
    LDI r10, 0
    STORE r20, r10
    JMP main_loop

not_esc:
    ; W = 87 (up)
    CMPI r3, 87
    JNZ r15, not_hup
    LDI r20, SCROLL_OFF
    LOAD r25, r20
    CMPI r25, 0
    JZ r15, main_loop
    LDI r14, BYTES_PER_ROW
    SUB r25, r14
    STORE r20, r25
    JMP main_loop

not_hup:
    ; S = 83 (down)
    CMPI r3, 83
    JNZ r15, main_loop
    LDI r20, SCROLL_OFF
    LOAD r25, r20
    LDI r14, BYTES_PER_ROW
    ADD r25, r14
    LDI r2, FILE_SIZE
    LOAD r2, r2
    CMP r25, r2
    BGE r15, main_loop
    STORE r20, r25
    JMP main_loop
