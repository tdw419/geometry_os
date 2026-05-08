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
LDI r13, 1

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
LDI r11, 0x0d1117
FILL r11

; Mode = list view
LDI r20, MODE
LDI r11, 0
STORE r20, r11

; Selected index = 0
LDI r20, SEL_INDEX
LDI r11, 0
STORE r20, r11

; Scroll offset = 0
LDI r20, SCROLL_OFF
LDI r11, 0
STORE r20, r11

; File size = 0
LDI r20, FILE_SIZE
LDI r11, 0
STORE r20, r11

; ── List files with LS ──
LDI r20, FILE_BUF
LS r20
; r4 = file count
LDI r21, FILE_COUNT
STORE r21, r4

; ── Parse LS buffer: build filename address table ──
LDI r20, FILE_BUF
LDI r22, 0
LDI r23, FNAME_TABLE

scan_loop:
    LDI r8, 16
    CMP r22, r8
    BGE r4, scan_done

    LOAD r11, r20
    CMPI r11, 0
    JZ r4, scan_done

    STORE r23, r20
    ADDI r23, 1

skip_chars:
    LOAD r11, r20
    CMPI r11, 0
    JZ r4, next_entry
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
    LDI r13, 1

    LDI r20, MODE
    LOAD r8, r20
    CMPI r8, 0
    JZ r4, draw_list_view

    JMP draw_hex_view

; ── LIST VIEW ─────────────────────────────────
draw_list_view:
    LDI r11, 0x0d1117
    FILL r11

    ; Title bar
    LDI r13, 0
    LDI r11, 0
    LDI r15, 256
    LDI r5, 22
    LDI r2, 0x1a1f29
    RECTF r13, r11, r15, r5, r2

    ; Title text
    LDI r13, 8
    LDI r11, TITLE_Y
    LDI r15, STR_BUF
    TEXT r13, r11, r15

    ; File count
    LDI r20, FILE_COUNT
    LOAD r11, r20
    LDI r20, STR_BUF
    ADDI r20, 160
    LDI r8, 48
    ADD r8, r11
    STORE r20, r8
    LDI r8, 0
    ADDI r20, 1
    STORE r20, r8
    LDI r13, 200
    LDI r11, TITLE_Y
    LDI r15, STR_BUF
    ADDI r15, 160
    TEXT r13, r11, r15

    ; Instructions
    LDI r13, 8
    LDI r11, 238
    LDI r15, STR_BUF
    ADDI r15, 64
    LDI r7, 0x888899
    LDI r3, 0x0d1117
    DRAWTEXT r13, r11, r15, r7, r3

    ; Draw file rows with selection highlight
    LDI r22, 0
    LDI r23, FNAME_TABLE
    LDI r24, ROW_BASE_Y

draw_rows:
    LDI r8, 16
    CMP r22, r8
    BGE r4, list_input

    LOAD r20, r23
    CMPI r20, 0
    JZ r4, list_input

    ; Check if selected
    LDI r25, SEL_INDEX
    LOAD r25, r25
    CMP r22, r25
    JZ r4, row_selected

    ; Normal row
    LDI r13, 4
    MOV r11, r24
    LDI r15, 248
    LDI r5, ROW_H
    LDI r2, 0x131820
    RECTF r13, r11, r15, r5, r2
    JMP draw_fname

row_selected:
    LDI r13, 4
    MOV r11, r24
    LDI r15, 248
    LDI r5, ROW_H
    LDI r2, 0x1a3a5c
    RECTF r13, r11, r15, r5, r2

    ; Arrow indicator
    LDI r20, STR_BUF
    ADDI r20, 192
    STRO r20, ">"

draw_fname:
    LDI r13, 16
    MOV r11, r24
    ADDI r11, 2
    TEXT r13, r11, r20

    ADDI r22, 1
    ADDI r23, 1
    LDI r8, ROW_H
    ADD r24, r8
    JMP draw_rows

; ── LIST INPUT ────────────────────────────────
list_input:
    FRAME

    IKEY r10
    CMPI r10, 0
    JZ r4, main_loop

    ; W = 87 (up)
    CMPI r10, 87
    JNZ r4, not_up
    LDI r20, SEL_INDEX
    LOAD r25, r20
    CMPI r25, 0
    JZ r4, main_loop
    SUBI r25, 1
    STORE r20, r25
    JMP main_loop

not_up:
    ; S = 83 (down)
    CMPI r10, 83
    JNZ r4, not_down
    LDI r20, SEL_INDEX
    LOAD r25, r20
    LDI r8, FILE_COUNT
    LOAD r8, r8
    SUBI r8, 1
    CMP r25, r8
    BGE r4, main_loop
    ADDI r25, 1
    STORE r20, r25
    JMP main_loop

not_down:
    ; ENTER = 10 or 13
    CMPI r10, 10
    JZ r4, open_selected
    CMPI r10, 13
    JZ r4, open_selected
    JMP main_loop

; ── OPEN SELECTED FILE ────────────────────────
open_selected:
    LDI r23, SEL_INDEX
    LOAD r22, r23
    LDI r23, FNAME_TABLE
    ADD r23, r22
    LOAD r20, r23
    CMPI r20, 0
    JZ r4, main_loop

    ; Reset scroll
    LDI r25, SCROLL_OFF
    LDI r8, 0
    STORE r25, r8

    ; Open
    LDI r8, 0
    OPEN r20, r8
    MOV r19, r4
    CMPI r19, 0xFFFFFFFF
    JZ r4, main_loop

    LDI r21, TEMP_FD
    STORE r21, r19

    ; Read content
    LDI r8, CONTENT_BUF
    LDI r14, 5120
    READ r19, r8, r14
    LDI r21, FILE_SIZE
    STORE r21, r4

    ; Null-terminate
    LDI r20, CONTENT_BUF
    ADD r20, r4
    LDI r11, 0
    STORE r20, r11

    CLOSE r19

    ; Switch to hex view
    LDI r20, MODE
    LDI r11, 1
    STORE r20, r11
    JMP main_loop

; ── HEX VIEW ─────────────────────────────────
draw_hex_view:
    LDI r11, 0x0d1117
    FILL r11

    ; Header bar
    LDI r13, 0
    LDI r11, 0
    LDI r15, 256
    LDI r5, 22
    LDI r2, 0x1a1f29
    RECTF r13, r11, r15, r5, r2

    ; Title
    LDI r13, 8
    LDI r11, TITLE_Y
    LDI r15, STR_BUF
    TEXT r13, r11, r15

    ; Separator line
    LDI r13, 0
    LDI r11, 26
    LDI r15, 256
    LDI r5, 1
    LDI r2, 0x2a3a4a
    RECTF r13, r11, r15, r5, r2

    ; Draw hex dump rows
    LDI r22, 0            ; row counter
    LDI r27, SCROLL_OFF
    LOAD r27, r27         ; byte offset

hex_row_loop:
    LDI r8, MAX_VISIBLE
    CMP r22, r8
    BGE r4, hex_footer

    ; Compute byte offset for this row
    MOV r28, r22
    LDI r8, BYTES_PER_ROW
    MUL r28, r8
    ADD r28, r27

    ; Check past EOF
    LDI r8, FILE_SIZE
    LOAD r8, r8
    CMP r28, r8
    BGE r4, hex_footer

    ; Y position for this row
    MOV r1, r22
    LDI r8, 14
    MUL r1, r8
    ADDI r1, 28

    ; ── Draw address offset ──
    ; Convert r28 to 4-hex-char string using lookup table
    ; High nibble of high byte
    LDI r21, STR_BUF
    ADDI r21, 192       ; offset string destination

    MOV r11, r28
    LDI r15, 12
    SHR r11, r15
    LDI r15, 0xF
    AND r11, r15
    LDI r15, HEX_TABLE
    ADD r15, r11
    LOAD r5, r15
    STORE r21, r5
    ADDI r21, 1

    ; Nibble 2 (bits 8-11)
    MOV r11, r28
    LDI r15, 8
    SHR r11, r15
    LDI r15, 0xF
    AND r11, r15
    LDI r15, HEX_TABLE
    ADD r15, r11
    LOAD r5, r15
    STORE r21, r5
    ADDI r21, 1

    ; Nibble 1 (bits 4-7)
    MOV r11, r28
    LDI r15, 4
    SHR r11, r15
    LDI r15, 0xF
    AND r11, r15
    LDI r15, HEX_TABLE
    ADD r15, r11
    LOAD r5, r15
    STORE r21, r5
    ADDI r21, 1

    ; Nibble 0 (bits 0-3)
    MOV r11, r28
    LDI r15, 0xF
    AND r11, r15
    LDI r15, HEX_TABLE
    ADD r15, r11
    LOAD r5, r15
    STORE r21, r5
    ADDI r21, 1

    ; Null terminate
    LDI r5, 0
    STORE r21, r5

    ; Draw address
    LDI r10, 4
    LDI r0, STR_BUF
    ADDI r0, 192
    LDI r7, 0x55aaff
    LDI r3, 0x0d1117
    DRAWTEXT r10, r1, r0, r7, r3

    ; ── Draw hex bytes ──
    LDI r29, 0           ; byte counter in row
    LDI r30, 48           ; x start for hex data

hex_byte_loop:
    LDI r8, BYTES_PER_ROW
    CMP r29, r8
    BGE r4, draw_ascii

    ; Check past EOF
    MOV r8, r28
    ADD r8, r29
    LDI r14, FILE_SIZE
    LOAD r14, r14
    CMP r8, r14
    BGE r4, draw_ascii

    ; Load byte
    LDI r8, CONTENT_BUF
    ADD r8, r28
    ADD r8, r29
    LOAD r11, r8

    ; Convert byte to 2 hex chars using lookup table
    LDI r21, STR_BUF
    ADDI r21, 208

    ; High nibble
    MOV r15, r11
    LDI r5, 4
    SHR r15, r5
    LDI r5, 0xF
    AND r15, r5
    LDI r5, HEX_TABLE
    ADD r5, r15
    LOAD r2, r5
    STORE r21, r2
    ADDI r21, 1

    ; Low nibble
    LDI r5, 0xF
    AND r11, r5
    LDI r5, HEX_TABLE
    ADD r5, r11
    LOAD r2, r5
    STORE r21, r2
    ADDI r21, 1

    ; Null terminate
    LDI r2, 0
    STORE r21, r2

    ; Draw hex pair
    MOV r10, r30
    LDI r0, STR_BUF
    ADDI r0, 208
    LDI r7, 0x44dd88
    LDI r3, 0x0d1117
    DRAWTEXT r10, r1, r0, r7, r3

    ADDI r30, 20

    ; Extra gap after 8 bytes
    LDI r8, 8
    CMP r29, r8
    JNZ r4, no_gap
    ADDI r30, 8
no_gap:
    ADDI r29, 1
    JMP hex_byte_loop

draw_ascii:
    ; Draw ASCII representation on right
    LDI r29, 0
    LDI r30, 218           ; x start for ASCII
ascii_loop:
    LDI r8, BYTES_PER_ROW
    CMP r29, r8
    BGE r4, hex_next_row

    MOV r8, r28
    ADD r8, r29
    LDI r14, FILE_SIZE
    LOAD r14, r14
    CMP r8, r14
    BGE r4, hex_next_row

    ; Load byte
    LDI r8, CONTENT_BUF
    ADD r8, r28
    ADD r8, r29
    LOAD r11, r8

    ; Printable check (32-126)
    CMPI r11, 32
    BLT r4, ascii_dot
    CMPI r11, 127
    BGE r4, ascii_dot
    ; Store char
    LDI r21, STR_BUF
    ADDI r21, 224
    STORE r21, r11
    LDI r8, 0
    ADDI r21, 1
    STORE r21, r8
    JMP ascii_draw

ascii_dot:
    LDI r21, STR_BUF
    ADDI r21, 224
    LDI r8, 46
    STORE r21, r8
    LDI r8, 0
    ADDI r21, 1
    STORE r21, r8

ascii_draw:
    MOV r10, r30
    LDI r0, STR_BUF
    ADDI r0, 224
    LDI r7, 0x889999
    LDI r3, 0x0d1117
    DRAWTEXT r10, r1, r0, r7, r3

    ADDI r30, 8
    ADDI r29, 1
    JMP ascii_loop

hex_next_row:
    ADDI r22, 1
    JMP hex_row_loop

; ── HEX FOOTER ────────────────────────────────
hex_footer:
    ; Footer bar
    LDI r13, 0
    LDI r11, 236
    LDI r15, 256
    LDI r5, 20
    LDI r2, 0x1a1f29
    RECTF r13, r11, r15, r5, r2

    ; Show file size
    LDI r20, STR_BUF
    ADDI r20, 240
    STRO r20, "Bytes:"

    ; File size as decimal
    LDI r8, FILE_SIZE
    LOAD r11, r8
    LDI r20, STR_BUF
    ADDI r20, 256

    ; Quick decimal conversion (up to 5 digits)
    LDI r14, 1
    LDI r15, 10000
    MOV r5, r11
    DIV r5, r15
    CMPI r5, 0
    JZ r4, skip10k
    ADDI r5, 48
    STORE r20, r5
    ADD r20, r14
    MOV r5, r11
    MOD r5, r15
    MOV r11, r5
skip10k:
    LDI r15, 1000
    MOV r5, r11
    DIV r5, r15
    CMPI r5, 0
    JZ r4, skip1k
    ADDI r5, 48
    STORE r20, r5
    ADD r20, r14
    MOV r5, r11
    MOD r5, r15
    MOV r11, r5
skip1k:
    LDI r15, 100
    MOV r5, r11
    DIV r5, r15
    CMPI r5, 0
    JZ r4, skip100
    ADDI r5, 48
    STORE r20, r5
    ADD r20, r14
    MOV r5, r11
    MOD r5, r15
    MOV r11, r5
skip100:
    LDI r15, 10
    MOV r5, r11
    DIV r5, r15
    ADDI r5, 48
    STORE r20, r5
    ADD r20, r14
    MOD r11, r15
    ADDI r11, 48
    STORE r20, r11
    ADD r20, r14
    LDI r11, 0
    STORE r20, r11

    ; Draw "Bytes: N"
    LDI r10, 4
    LDI r1, 240
    LDI r0, STR_BUF
    ADDI r0, 240
    LDI r7, 0xaaaaaa
    LDI r3, 0x1a1f29
    DRAWTEXT r10, r1, r0, r7, r3

    ; Scroll hint
    LDI r13, 110
    LDI r11, 240
    LDI r15, STR_BUF
    ADDI r15, 64
    DRAWTEXT r13, r11, r15, r7, r3

    ; ESC hint
    LDI r13, 190
    LDI r11, 240
    LDI r15, STR_BUF
    ADDI r15, 128
    DRAWTEXT r13, r11, r15, r7, r3

; ── HEX INPUT ─────────────────────────────────
hex_input:
    FRAME

    IKEY r10
    CMPI r10, 0
    JZ r4, main_loop

    ; ESC = 27 -- back to list
    CMPI r10, 27
    JNZ r4, not_esc
    LDI r20, MODE
    LDI r11, 0
    STORE r20, r11
    JMP main_loop

not_esc:
    ; W = 87 (up)
    CMPI r10, 87
    JNZ r4, not_hup
    LDI r20, SCROLL_OFF
    LOAD r25, r20
    CMPI r25, 0
    JZ r4, main_loop
    LDI r8, BYTES_PER_ROW
    SUB r25, r8
    STORE r20, r25
    JMP main_loop

not_hup:
    ; S = 83 (down)
    CMPI r10, 83
    JNZ r4, main_loop
    LDI r20, SCROLL_OFF
    LOAD r25, r20
    LDI r8, BYTES_PER_ROW
    ADD r25, r8
    LDI r14, FILE_SIZE
    LOAD r14, r14
    CMP r25, r14
    BGE r4, main_loop
    STORE r20, r25
    JMP main_loop
