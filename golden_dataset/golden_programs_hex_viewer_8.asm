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
LDI r12, 1

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
LDI r15, 0x0d1117
FILL r15

; Mode = list view
LDI r20, MODE
LDI r15, 0
STORE r20, r15

; Selected index = 0
LDI r20, SEL_INDEX
LDI r15, 0
STORE r20, r15

; Scroll offset = 0
LDI r20, SCROLL_OFF
LDI r15, 0
STORE r20, r15

; File size = 0
LDI r20, FILE_SIZE
LDI r15, 0
STORE r20, r15

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
    LDI r1, 16
    CMP r22, r1
    BGE r4, scan_done

    LOAD r15, r20
    CMPI r15, 0
    JZ r4, scan_done

    STORE r23, r20
    ADDI r23, 1

skip_chars:
    LOAD r15, r20
    CMPI r15, 0
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
    LDI r12, 1

    LDI r20, MODE
    LOAD r1, r20
    CMPI r1, 0
    JZ r4, draw_list_view

    JMP draw_hex_view

; ── LIST VIEW ─────────────────────────────────
draw_list_view:
    LDI r15, 0x0d1117
    FILL r15

    ; Title bar
    LDI r12, 0
    LDI r15, 0
    LDI r5, 256
    LDI r8, 22
    LDI r6, 0x1a1f29
    RECTF r12, r15, r5, r8, r6

    ; Title text
    LDI r12, 8
    LDI r15, TITLE_Y
    LDI r5, STR_BUF
    TEXT r12, r15, r5

    ; File count
    LDI r20, FILE_COUNT
    LOAD r15, r20
    LDI r20, STR_BUF
    ADDI r20, 160
    LDI r1, 48
    ADD r1, r15
    STORE r20, r1
    LDI r1, 0
    ADDI r20, 1
    STORE r20, r1
    LDI r12, 200
    LDI r15, TITLE_Y
    LDI r5, STR_BUF
    ADDI r5, 160
    TEXT r12, r15, r5

    ; Instructions
    LDI r12, 8
    LDI r15, 238
    LDI r5, STR_BUF
    ADDI r5, 64
    LDI r11, 0x888899
    LDI r7, 0x0d1117
    DRAWTEXT r12, r15, r5, r11, r7

    ; Draw file rows with selection highlight
    LDI r22, 0
    LDI r23, FNAME_TABLE
    LDI r24, ROW_BASE_Y

draw_rows:
    LDI r1, 16
    CMP r22, r1
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
    LDI r12, 4
    MOV r15, r24
    LDI r5, 248
    LDI r8, ROW_H
    LDI r6, 0x131820
    RECTF r12, r15, r5, r8, r6
    JMP draw_fname

row_selected:
    LDI r12, 4
    MOV r15, r24
    LDI r5, 248
    LDI r8, ROW_H
    LDI r6, 0x1a3a5c
    RECTF r12, r15, r5, r8, r6

    ; Arrow indicator
    LDI r20, STR_BUF
    ADDI r20, 192
    STRO r20, ">"

draw_fname:
    LDI r12, 16
    MOV r15, r24
    ADDI r15, 2
    TEXT r12, r15, r20

    ADDI r22, 1
    ADDI r23, 1
    LDI r1, ROW_H
    ADD r24, r1
    JMP draw_rows

; ── LIST INPUT ────────────────────────────────
list_input:
    FRAME

    IKEY r14
    CMPI r14, 0
    JZ r4, main_loop

    ; W = 87 (up)
    CMPI r14, 87
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
    CMPI r14, 83
    JNZ r4, not_down
    LDI r20, SEL_INDEX
    LOAD r25, r20
    LDI r1, FILE_COUNT
    LOAD r1, r1
    SUBI r1, 1
    CMP r25, r1
    BGE r4, main_loop
    ADDI r25, 1
    STORE r20, r25
    JMP main_loop

not_down:
    ; ENTER = 10 or 13
    CMPI r14, 10
    JZ r4, open_selected
    CMPI r14, 13
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
    LDI r1, 0
    STORE r25, r1

    ; Open
    LDI r1, 0
    OPEN r20, r1
    MOV r19, r4
    CMPI r19, 0xFFFFFFFF
    JZ r4, main_loop

    LDI r21, TEMP_FD
    STORE r21, r19

    ; Read content
    LDI r1, CONTENT_BUF
    LDI r13, 5120
    READ r19, r1, r13
    LDI r21, FILE_SIZE
    STORE r21, r4

    ; Null-terminate
    LDI r20, CONTENT_BUF
    ADD r20, r4
    LDI r15, 0
    STORE r20, r15

    CLOSE r19

    ; Switch to hex view
    LDI r20, MODE
    LDI r15, 1
    STORE r20, r15
    JMP main_loop

; ── HEX VIEW ─────────────────────────────────
draw_hex_view:
    LDI r15, 0x0d1117
    FILL r15

    ; Header bar
    LDI r12, 0
    LDI r15, 0
    LDI r5, 256
    LDI r8, 22
    LDI r6, 0x1a1f29
    RECTF r12, r15, r5, r8, r6

    ; Title
    LDI r12, 8
    LDI r15, TITLE_Y
    LDI r5, STR_BUF
    TEXT r12, r15, r5

    ; Separator line
    LDI r12, 0
    LDI r15, 26
    LDI r5, 256
    LDI r8, 1
    LDI r6, 0x2a3a4a
    RECTF r12, r15, r5, r8, r6

    ; Draw hex dump rows
    LDI r22, 0            ; row counter
    LDI r27, SCROLL_OFF
    LOAD r27, r27         ; byte offset

hex_row_loop:
    LDI r1, MAX_VISIBLE
    CMP r22, r1
    BGE r4, hex_footer

    ; Compute byte offset for this row
    MOV r28, r22
    LDI r1, BYTES_PER_ROW
    MUL r28, r1
    ADD r28, r27

    ; Check past EOF
    LDI r1, FILE_SIZE
    LOAD r1, r1
    CMP r28, r1
    BGE r4, hex_footer

    ; Y position for this row
    MOV r10, r22
    LDI r1, 14
    MUL r10, r1
    ADDI r10, 28

    ; ── Draw address offset ──
    ; Convert r28 to 4-hex-char string using lookup table
    ; High nibble of high byte
    LDI r21, STR_BUF
    ADDI r21, 192       ; offset string destination

    MOV r15, r28
    LDI r5, 12
    SHR r15, r5
    LDI r5, 0xF
    AND r15, r5
    LDI r5, HEX_TABLE
    ADD r5, r15
    LOAD r8, r5
    STORE r21, r8
    ADDI r21, 1

    ; Nibble 2 (bits 8-11)
    MOV r15, r28
    LDI r5, 8
    SHR r15, r5
    LDI r5, 0xF
    AND r15, r5
    LDI r5, HEX_TABLE
    ADD r5, r15
    LOAD r8, r5
    STORE r21, r8
    ADDI r21, 1

    ; Nibble 1 (bits 4-7)
    MOV r15, r28
    LDI r5, 4
    SHR r15, r5
    LDI r5, 0xF
    AND r15, r5
    LDI r5, HEX_TABLE
    ADD r5, r15
    LOAD r8, r5
    STORE r21, r8
    ADDI r21, 1

    ; Nibble 0 (bits 0-3)
    MOV r15, r28
    LDI r5, 0xF
    AND r15, r5
    LDI r5, HEX_TABLE
    ADD r5, r15
    LOAD r8, r5
    STORE r21, r8
    ADDI r21, 1

    ; Null terminate
    LDI r8, 0
    STORE r21, r8

    ; Draw address
    LDI r14, 4
    LDI r2, STR_BUF
    ADDI r2, 192
    LDI r11, 0x55aaff
    LDI r7, 0x0d1117
    DRAWTEXT r14, r10, r2, r11, r7

    ; ── Draw hex bytes ──
    LDI r29, 0           ; byte counter in row
    LDI r30, 48           ; x start for hex data

hex_byte_loop:
    LDI r1, BYTES_PER_ROW
    CMP r29, r1
    BGE r4, draw_ascii

    ; Check past EOF
    MOV r1, r28
    ADD r1, r29
    LDI r13, FILE_SIZE
    LOAD r13, r13
    CMP r1, r13
    BGE r4, draw_ascii

    ; Load byte
    LDI r1, CONTENT_BUF
    ADD r1, r28
    ADD r1, r29
    LOAD r15, r1

    ; Convert byte to 2 hex chars using lookup table
    LDI r21, STR_BUF
    ADDI r21, 208

    ; High nibble
    MOV r5, r15
    LDI r8, 4
    SHR r5, r8
    LDI r8, 0xF
    AND r5, r8
    LDI r8, HEX_TABLE
    ADD r8, r5
    LOAD r6, r8
    STORE r21, r6
    ADDI r21, 1

    ; Low nibble
    LDI r8, 0xF
    AND r15, r8
    LDI r8, HEX_TABLE
    ADD r8, r15
    LOAD r6, r8
    STORE r21, r6
    ADDI r21, 1

    ; Null terminate
    LDI r6, 0
    STORE r21, r6

    ; Draw hex pair
    MOV r14, r30
    LDI r2, STR_BUF
    ADDI r2, 208
    LDI r11, 0x44dd88
    LDI r7, 0x0d1117
    DRAWTEXT r14, r10, r2, r11, r7

    ADDI r30, 20

    ; Extra gap after 8 bytes
    LDI r1, 8
    CMP r29, r1
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
    LDI r1, BYTES_PER_ROW
    CMP r29, r1
    BGE r4, hex_next_row

    MOV r1, r28
    ADD r1, r29
    LDI r13, FILE_SIZE
    LOAD r13, r13
    CMP r1, r13
    BGE r4, hex_next_row

    ; Load byte
    LDI r1, CONTENT_BUF
    ADD r1, r28
    ADD r1, r29
    LOAD r15, r1

    ; Printable check (32-126)
    CMPI r15, 32
    BLT r4, ascii_dot
    CMPI r15, 127
    BGE r4, ascii_dot
    ; Store char
    LDI r21, STR_BUF
    ADDI r21, 224
    STORE r21, r15
    LDI r1, 0
    ADDI r21, 1
    STORE r21, r1
    JMP ascii_draw

ascii_dot:
    LDI r21, STR_BUF
    ADDI r21, 224
    LDI r1, 46
    STORE r21, r1
    LDI r1, 0
    ADDI r21, 1
    STORE r21, r1

ascii_draw:
    MOV r14, r30
    LDI r2, STR_BUF
    ADDI r2, 224
    LDI r11, 0x889999
    LDI r7, 0x0d1117
    DRAWTEXT r14, r10, r2, r11, r7

    ADDI r30, 8
    ADDI r29, 1
    JMP ascii_loop

hex_next_row:
    ADDI r22, 1
    JMP hex_row_loop

; ── HEX FOOTER ────────────────────────────────
hex_footer:
    ; Footer bar
    LDI r12, 0
    LDI r15, 236
    LDI r5, 256
    LDI r8, 20
    LDI r6, 0x1a1f29
    RECTF r12, r15, r5, r8, r6

    ; Show file size
    LDI r20, STR_BUF
    ADDI r20, 240
    STRO r20, "Bytes:"

    ; File size as decimal
    LDI r1, FILE_SIZE
    LOAD r15, r1
    LDI r20, STR_BUF
    ADDI r20, 256

    ; Quick decimal conversion (up to 5 digits)
    LDI r13, 1
    LDI r5, 10000
    MOV r8, r15
    DIV r8, r5
    CMPI r8, 0
    JZ r4, skip10k
    ADDI r8, 48
    STORE r20, r8
    ADD r20, r13
    MOV r8, r15
    MOD r8, r5
    MOV r15, r8
skip10k:
    LDI r5, 1000
    MOV r8, r15
    DIV r8, r5
    CMPI r8, 0
    JZ r4, skip1k
    ADDI r8, 48
    STORE r20, r8
    ADD r20, r13
    MOV r8, r15
    MOD r8, r5
    MOV r15, r8
skip1k:
    LDI r5, 100
    MOV r8, r15
    DIV r8, r5
    CMPI r8, 0
    JZ r4, skip100
    ADDI r8, 48
    STORE r20, r8
    ADD r20, r13
    MOV r8, r15
    MOD r8, r5
    MOV r15, r8
skip100:
    LDI r5, 10
    MOV r8, r15
    DIV r8, r5
    ADDI r8, 48
    STORE r20, r8
    ADD r20, r13
    MOD r15, r5
    ADDI r15, 48
    STORE r20, r15
    ADD r20, r13
    LDI r15, 0
    STORE r20, r15

    ; Draw "Bytes: N"
    LDI r14, 4
    LDI r10, 240
    LDI r2, STR_BUF
    ADDI r2, 240
    LDI r11, 0xaaaaaa
    LDI r7, 0x1a1f29
    DRAWTEXT r14, r10, r2, r11, r7

    ; Scroll hint
    LDI r12, 110
    LDI r15, 240
    LDI r5, STR_BUF
    ADDI r5, 64
    DRAWTEXT r12, r15, r5, r11, r7

    ; ESC hint
    LDI r12, 190
    LDI r15, 240
    LDI r5, STR_BUF
    ADDI r5, 128
    DRAWTEXT r12, r15, r5, r11, r7

; ── HEX INPUT ─────────────────────────────────
hex_input:
    FRAME

    IKEY r14
    CMPI r14, 0
    JZ r4, main_loop

    ; ESC = 27 -- back to list
    CMPI r14, 27
    JNZ r4, not_esc
    LDI r20, MODE
    LDI r15, 0
    STORE r20, r15
    JMP main_loop

not_esc:
    ; W = 87 (up)
    CMPI r14, 87
    JNZ r4, not_hup
    LDI r20, SCROLL_OFF
    LOAD r25, r20
    CMPI r25, 0
    JZ r4, main_loop
    LDI r1, BYTES_PER_ROW
    SUB r25, r1
    STORE r20, r25
    JMP main_loop

not_hup:
    ; S = 83 (down)
    CMPI r14, 83
    JNZ r4, main_loop
    LDI r20, SCROLL_OFF
    LOAD r25, r20
    LDI r1, BYTES_PER_ROW
    ADD r25, r1
    LDI r13, FILE_SIZE
    LOAD r13, r13
    CMP r25, r13
    BGE r4, main_loop
    STORE r20, r25
    JMP main_loop
