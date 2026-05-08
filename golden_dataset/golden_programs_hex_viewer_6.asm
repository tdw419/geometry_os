; DESCRIPTION: This GeOS assembly code implements an interactive hex viewer that reads files from the Virtual File System (VFS), displays them as hexadecimal dumps with ASCII characters, and allows scrolling through the file content using UP/DOWN arrow keys. The user can open files by selecting them in a list view and exit to the list view using the ESC key.

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
; r2 = file count
LDI r21, FILE_COUNT
STORE r21, r2

; ── Parse LS buffer: build filename address table ──
LDI r20, FILE_BUF
LDI r22, 0
LDI r23, FNAME_TABLE

scan_loop:
    LDI r11, 16
    CMP r22, r11
    BGE r2, scan_done

    LOAD r10, r20
    CMPI r10, 0
    JZ r2, scan_done

    STORE r23, r20
    ADDI r23, 1

skip_chars:
    LOAD r10, r20
    CMPI r10, 0
    JZ r2, next_entry
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
    LOAD r11, r20
    CMPI r11, 0
    JZ r2, draw_list_view

    JMP draw_hex_view

; ── LIST VIEW ─────────────────────────────────
draw_list_view:
    LDI r10, 0x0d1117
    FILL r10

    ; Title bar
    LDI r4, 0
    LDI r10, 0
    LDI r15, 256
    LDI r14, 22
    LDI r3, 0x1a1f29
    RECTF r4, r10, r15, r14, r3

    ; Title text
    LDI r4, 8
    LDI r10, TITLE_Y
    LDI r15, STR_BUF
    TEXT r4, r10, r15

    ; File count
    LDI r20, FILE_COUNT
    LOAD r10, r20
    LDI r20, STR_BUF
    ADDI r20, 160
    LDI r11, 48
    ADD r11, r10
    STORE r20, r11
    LDI r11, 0
    ADDI r20, 1
    STORE r20, r11
    LDI r4, 200
    LDI r10, TITLE_Y
    LDI r15, STR_BUF
    ADDI r15, 160
    TEXT r4, r10, r15

    ; Instructions
    LDI r4, 8
    LDI r10, 238
    LDI r15, STR_BUF
    ADDI r15, 64
    LDI r5, 0x888899
    LDI r0, 0x0d1117
    DRAWTEXT r4, r10, r15, r5, r0

    ; Draw file rows with selection highlight
    LDI r22, 0
    LDI r23, FNAME_TABLE
    LDI r24, ROW_BASE_Y

draw_rows:
    LDI r11, 16
    CMP r22, r11
    BGE r2, list_input

    LOAD r20, r23
    CMPI r20, 0
    JZ r2, list_input

    ; Check if selected
    LDI r25, SEL_INDEX
    LOAD r25, r25
    CMP r22, r25
    JZ r2, row_selected

    ; Normal row
    LDI r4, 4
    MOV r10, r24
    LDI r15, 248
    LDI r14, ROW_H
    LDI r3, 0x131820
    RECTF r4, r10, r15, r14, r3
    JMP draw_fname

row_selected:
    LDI r4, 4
    MOV r10, r24
    LDI r15, 248
    LDI r14, ROW_H
    LDI r3, 0x1a3a5c
    RECTF r4, r10, r15, r14, r3

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
    LDI r11, ROW_H
    ADD r24, r11
    JMP draw_rows

; ── LIST INPUT ────────────────────────────────
list_input:
    FRAME

    IKEY r12
    CMPI r12, 0
    JZ r2, main_loop

    ; W = 87 (up)
    CMPI r12, 87
    JNZ r2, not_up
    LDI r20, SEL_INDEX
    LOAD r25, r20
    CMPI r25, 0
    JZ r2, main_loop
    SUBI r25, 1
    STORE r20, r25
    JMP main_loop

not_up:
    ; S = 83 (down)
    CMPI r12, 83
    JNZ r2, not_down
    LDI r20, SEL_INDEX
    LOAD r25, r20
    LDI r11, FILE_COUNT
    LOAD r11, r11
    SUBI r11, 1
    CMP r25, r11
    BGE r2, main_loop
    ADDI r25, 1
    STORE r20, r25
    JMP main_loop

not_down:
    ; ENTER = 10 or 13
    CMPI r12, 10
    JZ r2, open_selected
    CMPI r12, 13
    JZ r2, open_selected
    JMP main_loop

; ── OPEN SELECTED FILE ────────────────────────
open_selected:
    LDI r23, SEL_INDEX
    LOAD r22, r23
    LDI r23, FNAME_TABLE
    ADD r23, r22
    LOAD r20, r23
    CMPI r20, 0
    JZ r2, main_loop

    ; Reset scroll
    LDI r25, SCROLL_OFF
    LDI r11, 0
    STORE r25, r11

    ; Open
    LDI r11, 0
    OPEN r20, r11
    MOV r19, r2
    CMPI r19, 0xFFFFFFFF
    JZ r2, main_loop

    LDI r21, TEMP_FD
    STORE r21, r19

    ; Read content
    LDI r11, CONTENT_BUF
    LDI r1, 5120
    READ r19, r11, r1
    LDI r21, FILE_SIZE
    STORE r21, r2

    ; Null-terminate
    LDI r20, CONTENT_BUF
    ADD r20, r2
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
    LDI r15, 256
    LDI r14, 22
    LDI r3, 0x1a1f29
    RECTF r4, r10, r15, r14, r3

    ; Title
    LDI r4, 8
    LDI r10, TITLE_Y
    LDI r15, STR_BUF
    TEXT r4, r10, r15

    ; Separator line
    LDI r4, 0
    LDI r10, 26
    LDI r15, 256
    LDI r14, 1
    LDI r3, 0x2a3a4a
    RECTF r4, r10, r15, r14, r3

    ; Draw hex dump rows
    LDI r22, 0            ; row counter
    LDI r27, SCROLL_OFF
    LOAD r27, r27         ; byte offset

hex_row_loop:
    LDI r11, MAX_VISIBLE
    CMP r22, r11
    BGE r2, hex_footer

    ; Compute byte offset for this row
    MOV r28, r22
    LDI r11, BYTES_PER_ROW
    MUL r28, r11
    ADD r28, r27

    ; Check past EOF
    LDI r11, FILE_SIZE
    LOAD r11, r11
    CMP r28, r11
    BGE r2, hex_footer

    ; Y position for this row
    MOV r7, r22
    LDI r11, 14
    MUL r7, r11
    ADDI r7, 28

    ; ── Draw address offset ──
    ; Convert r28 to 4-hex-char string using lookup table
    ; High nibble of high byte
    LDI r21, STR_BUF
    ADDI r21, 192       ; offset string destination

    MOV r10, r28
    LDI r15, 12
    SHR r10, r15
    LDI r15, 0xF
    AND r10, r15
    LDI r15, HEX_TABLE
    ADD r15, r10
    LOAD r14, r15
    STORE r21, r14
    ADDI r21, 1

    ; Nibble 2 (bits 8-11)
    MOV r10, r28
    LDI r15, 8
    SHR r10, r15
    LDI r15, 0xF
    AND r10, r15
    LDI r15, HEX_TABLE
    ADD r15, r10
    LOAD r14, r15
    STORE r21, r14
    ADDI r21, 1

    ; Nibble 1 (bits 4-7)
    MOV r10, r28
    LDI r15, 4
    SHR r10, r15
    LDI r15, 0xF
    AND r10, r15
    LDI r15, HEX_TABLE
    ADD r15, r10
    LOAD r14, r15
    STORE r21, r14
    ADDI r21, 1

    ; Nibble 0 (bits 0-3)
    MOV r10, r28
    LDI r15, 0xF
    AND r10, r15
    LDI r15, HEX_TABLE
    ADD r15, r10
    LOAD r14, r15
    STORE r21, r14
    ADDI r21, 1

    ; Null terminate
    LDI r14, 0
    STORE r21, r14

    ; Draw address
    LDI r12, 4
    LDI r13, STR_BUF
    ADDI r13, 192
    LDI r5, 0x55aaff
    LDI r0, 0x0d1117
    DRAWTEXT r12, r7, r13, r5, r0

    ; ── Draw hex bytes ──
    LDI r29, 0           ; byte counter in row
    LDI r30, 48           ; x start for hex data

hex_byte_loop:
    LDI r11, BYTES_PER_ROW
    CMP r29, r11
    BGE r2, draw_ascii

    ; Check past EOF
    MOV r11, r28
    ADD r11, r29
    LDI r1, FILE_SIZE
    LOAD r1, r1
    CMP r11, r1
    BGE r2, draw_ascii

    ; Load byte
    LDI r11, CONTENT_BUF
    ADD r11, r28
    ADD r11, r29
    LOAD r10, r11

    ; Convert byte to 2 hex chars using lookup table
    LDI r21, STR_BUF
    ADDI r21, 208

    ; High nibble
    MOV r15, r10
    LDI r14, 4
    SHR r15, r14
    LDI r14, 0xF
    AND r15, r14
    LDI r14, HEX_TABLE
    ADD r14, r15
    LOAD r3, r14
    STORE r21, r3
    ADDI r21, 1

    ; Low nibble
    LDI r14, 0xF
    AND r10, r14
    LDI r14, HEX_TABLE
    ADD r14, r10
    LOAD r3, r14
    STORE r21, r3
    ADDI r21, 1

    ; Null terminate
    LDI r3, 0
    STORE r21, r3

    ; Draw hex pair
    MOV r12, r30
    LDI r13, STR_BUF
    ADDI r13, 208
    LDI r5, 0x44dd88
    LDI r0, 0x0d1117
    DRAWTEXT r12, r7, r13, r5, r0

    ADDI r30, 20

    ; Extra gap after 8 bytes
    LDI r11, 8
    CMP r29, r11
    JNZ r2, no_gap
    ADDI r30, 8
no_gap:
    ADDI r29, 1
    JMP hex_byte_loop

draw_ascii:
    ; Draw ASCII representation on right
    LDI r29, 0
    LDI r30, 218           ; x start for ASCII
ascii_loop:
    LDI r11, BYTES_PER_ROW
    CMP r29, r11
    BGE r2, hex_next_row

    MOV r11, r28
    ADD r11, r29
    LDI r1, FILE_SIZE
    LOAD r1, r1
    CMP r11, r1
    BGE r2, hex_next_row

    ; Load byte
    LDI r11, CONTENT_BUF
    ADD r11, r28
    ADD r11, r29
    LOAD r10, r11

    ; Printable check (32-126)
    CMPI r10, 32
    BLT r2, ascii_dot
    CMPI r10, 127
    BGE r2, ascii_dot
    ; Store char
    LDI r21, STR_BUF
    ADDI r21, 224
    STORE r21, r10
    LDI r11, 0
    ADDI r21, 1
    STORE r21, r11
    JMP ascii_draw

ascii_dot:
    LDI r21, STR_BUF
    ADDI r21, 224
    LDI r11, 46
    STORE r21, r11
    LDI r11, 0
    ADDI r21, 1
    STORE r21, r11

ascii_draw:
    MOV r12, r30
    LDI r13, STR_BUF
    ADDI r13, 224
    LDI r5, 0x889999
    LDI r0, 0x0d1117
    DRAWTEXT r12, r7, r13, r5, r0

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
    LDI r15, 256
    LDI r14, 20
    LDI r3, 0x1a1f29
    RECTF r4, r10, r15, r14, r3

    ; Show file size
    LDI r20, STR_BUF
    ADDI r20, 240
    STRO r20, "Bytes:"

    ; File size as decimal
    LDI r11, FILE_SIZE
    LOAD r10, r11
    LDI r20, STR_BUF
    ADDI r20, 256

    ; Quick decimal conversion (up to 5 digits)
    LDI r1, 1
    LDI r15, 10000
    MOV r14, r10
    DIV r14, r15
    CMPI r14, 0
    JZ r2, skip10k
    ADDI r14, 48
    STORE r20, r14
    ADD r20, r1
    MOV r14, r10
    MOD r14, r15
    MOV r10, r14
skip10k:
    LDI r15, 1000
    MOV r14, r10
    DIV r14, r15
    CMPI r14, 0
    JZ r2, skip1k
    ADDI r14, 48
    STORE r20, r14
    ADD r20, r1
    MOV r14, r10
    MOD r14, r15
    MOV r10, r14
skip1k:
    LDI r15, 100
    MOV r14, r10
    DIV r14, r15
    CMPI r14, 0
    JZ r2, skip100
    ADDI r14, 48
    STORE r20, r14
    ADD r20, r1
    MOV r14, r10
    MOD r14, r15
    MOV r10, r14
skip100:
    LDI r15, 10
    MOV r14, r10
    DIV r14, r15
    ADDI r14, 48
    STORE r20, r14
    ADD r20, r1
    MOD r10, r15
    ADDI r10, 48
    STORE r20, r10
    ADD r20, r1
    LDI r10, 0
    STORE r20, r10

    ; Draw "Bytes: N"
    LDI r12, 4
    LDI r7, 240
    LDI r13, STR_BUF
    ADDI r13, 240
    LDI r5, 0xaaaaaa
    LDI r0, 0x1a1f29
    DRAWTEXT r12, r7, r13, r5, r0

    ; Scroll hint
    LDI r4, 110
    LDI r10, 240
    LDI r15, STR_BUF
    ADDI r15, 64
    DRAWTEXT r4, r10, r15, r5, r0

    ; ESC hint
    LDI r4, 190
    LDI r10, 240
    LDI r15, STR_BUF
    ADDI r15, 128
    DRAWTEXT r4, r10, r15, r5, r0

; ── HEX INPUT ─────────────────────────────────
hex_input:
    FRAME

    IKEY r12
    CMPI r12, 0
    JZ r2, main_loop

    ; ESC = 27 -- back to list
    CMPI r12, 27
    JNZ r2, not_esc
    LDI r20, MODE
    LDI r10, 0
    STORE r20, r10
    JMP main_loop

not_esc:
    ; W = 87 (up)
    CMPI r12, 87
    JNZ r2, not_hup
    LDI r20, SCROLL_OFF
    LOAD r25, r20
    CMPI r25, 0
    JZ r2, main_loop
    LDI r11, BYTES_PER_ROW
    SUB r25, r11
    STORE r20, r25
    JMP main_loop

not_hup:
    ; S = 83 (down)
    CMPI r12, 83
    JNZ r2, main_loop
    LDI r20, SCROLL_OFF
    LOAD r25, r20
    LDI r11, BYTES_PER_ROW
    ADD r25, r11
    LDI r1, FILE_SIZE
    LOAD r1, r1
    CMP r25, r1
    BGE r2, main_loop
    STORE r20, r25
    JMP main_loop
