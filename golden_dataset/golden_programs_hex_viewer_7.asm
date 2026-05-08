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
LDI r10, 1

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
LDI r8, 0x0d1117
FILL r8

; Mode = list view
LDI r20, MODE
LDI r8, 0
STORE r20, r8

; Selected index = 0
LDI r20, SEL_INDEX
LDI r8, 0
STORE r20, r8

; Scroll offset = 0
LDI r20, SCROLL_OFF
LDI r8, 0
STORE r20, r8

; File size = 0
LDI r20, FILE_SIZE
LDI r8, 0
STORE r20, r8

; ── List files with LS ──
LDI r20, FILE_BUF
LS r20
; r3 = file count
LDI r21, FILE_COUNT
STORE r21, r3

; ── Parse LS buffer: build filename address table ──
LDI r20, FILE_BUF
LDI r22, 0
LDI r23, FNAME_TABLE

scan_loop:
    LDI r12, 16
    CMP r22, r12
    BGE r3, scan_done

    LOAD r8, r20
    CMPI r8, 0
    JZ r3, scan_done

    STORE r23, r20
    ADDI r23, 1

skip_chars:
    LOAD r8, r20
    CMPI r8, 0
    JZ r3, next_entry
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
    LDI r10, 1

    LDI r20, MODE
    LOAD r12, r20
    CMPI r12, 0
    JZ r3, draw_list_view

    JMP draw_hex_view

; ── LIST VIEW ─────────────────────────────────
draw_list_view:
    LDI r8, 0x0d1117
    FILL r8

    ; Title bar
    LDI r10, 0
    LDI r8, 0
    LDI r6, 256
    LDI r13, 22
    LDI r5, 0x1a1f29
    RECTF r10, r8, r6, r13, r5

    ; Title text
    LDI r10, 8
    LDI r8, TITLE_Y
    LDI r6, STR_BUF
    TEXT r10, r8, r6

    ; File count
    LDI r20, FILE_COUNT
    LOAD r8, r20
    LDI r20, STR_BUF
    ADDI r20, 160
    LDI r12, 48
    ADD r12, r8
    STORE r20, r12
    LDI r12, 0
    ADDI r20, 1
    STORE r20, r12
    LDI r10, 200
    LDI r8, TITLE_Y
    LDI r6, STR_BUF
    ADDI r6, 160
    TEXT r10, r8, r6

    ; Instructions
    LDI r10, 8
    LDI r8, 238
    LDI r6, STR_BUF
    ADDI r6, 64
    LDI r9, 0x888899
    LDI r0, 0x0d1117
    DRAWTEXT r10, r8, r6, r9, r0

    ; Draw file rows with selection highlight
    LDI r22, 0
    LDI r23, FNAME_TABLE
    LDI r24, ROW_BASE_Y

draw_rows:
    LDI r12, 16
    CMP r22, r12
    BGE r3, list_input

    LOAD r20, r23
    CMPI r20, 0
    JZ r3, list_input

    ; Check if selected
    LDI r25, SEL_INDEX
    LOAD r25, r25
    CMP r22, r25
    JZ r3, row_selected

    ; Normal row
    LDI r10, 4
    MOV r8, r24
    LDI r6, 248
    LDI r13, ROW_H
    LDI r5, 0x131820
    RECTF r10, r8, r6, r13, r5
    JMP draw_fname

row_selected:
    LDI r10, 4
    MOV r8, r24
    LDI r6, 248
    LDI r13, ROW_H
    LDI r5, 0x1a3a5c
    RECTF r10, r8, r6, r13, r5

    ; Arrow indicator
    LDI r20, STR_BUF
    ADDI r20, 192
    STRO r20, ">"

draw_fname:
    LDI r10, 16
    MOV r8, r24
    ADDI r8, 2
    TEXT r10, r8, r20

    ADDI r22, 1
    ADDI r23, 1
    LDI r12, ROW_H
    ADD r24, r12
    JMP draw_rows

; ── LIST INPUT ────────────────────────────────
list_input:
    FRAME

    IKEY r1
    CMPI r1, 0
    JZ r3, main_loop

    ; W = 87 (up)
    CMPI r1, 87
    JNZ r3, not_up
    LDI r20, SEL_INDEX
    LOAD r25, r20
    CMPI r25, 0
    JZ r3, main_loop
    SUBI r25, 1
    STORE r20, r25
    JMP main_loop

not_up:
    ; S = 83 (down)
    CMPI r1, 83
    JNZ r3, not_down
    LDI r20, SEL_INDEX
    LOAD r25, r20
    LDI r12, FILE_COUNT
    LOAD r12, r12
    SUBI r12, 1
    CMP r25, r12
    BGE r3, main_loop
    ADDI r25, 1
    STORE r20, r25
    JMP main_loop

not_down:
    ; ENTER = 10 or 13
    CMPI r1, 10
    JZ r3, open_selected
    CMPI r1, 13
    JZ r3, open_selected
    JMP main_loop

; ── OPEN SELECTED FILE ────────────────────────
open_selected:
    LDI r23, SEL_INDEX
    LOAD r22, r23
    LDI r23, FNAME_TABLE
    ADD r23, r22
    LOAD r20, r23
    CMPI r20, 0
    JZ r3, main_loop

    ; Reset scroll
    LDI r25, SCROLL_OFF
    LDI r12, 0
    STORE r25, r12

    ; Open
    LDI r12, 0
    OPEN r20, r12
    MOV r19, r3
    CMPI r19, 0xFFFFFFFF
    JZ r3, main_loop

    LDI r21, TEMP_FD
    STORE r21, r19

    ; Read content
    LDI r12, CONTENT_BUF
    LDI r7, 5120
    READ r19, r12, r7
    LDI r21, FILE_SIZE
    STORE r21, r3

    ; Null-terminate
    LDI r20, CONTENT_BUF
    ADD r20, r3
    LDI r8, 0
    STORE r20, r8

    CLOSE r19

    ; Switch to hex view
    LDI r20, MODE
    LDI r8, 1
    STORE r20, r8
    JMP main_loop

; ── HEX VIEW ─────────────────────────────────
draw_hex_view:
    LDI r8, 0x0d1117
    FILL r8

    ; Header bar
    LDI r10, 0
    LDI r8, 0
    LDI r6, 256
    LDI r13, 22
    LDI r5, 0x1a1f29
    RECTF r10, r8, r6, r13, r5

    ; Title
    LDI r10, 8
    LDI r8, TITLE_Y
    LDI r6, STR_BUF
    TEXT r10, r8, r6

    ; Separator line
    LDI r10, 0
    LDI r8, 26
    LDI r6, 256
    LDI r13, 1
    LDI r5, 0x2a3a4a
    RECTF r10, r8, r6, r13, r5

    ; Draw hex dump rows
    LDI r22, 0            ; row counter
    LDI r27, SCROLL_OFF
    LOAD r27, r27         ; byte offset

hex_row_loop:
    LDI r12, MAX_VISIBLE
    CMP r22, r12
    BGE r3, hex_footer

    ; Compute byte offset for this row
    MOV r28, r22
    LDI r12, BYTES_PER_ROW
    MUL r28, r12
    ADD r28, r27

    ; Check past EOF
    LDI r12, FILE_SIZE
    LOAD r12, r12
    CMP r28, r12
    BGE r3, hex_footer

    ; Y position for this row
    MOV r14, r22
    LDI r12, 14
    MUL r14, r12
    ADDI r14, 28

    ; ── Draw address offset ──
    ; Convert r28 to 4-hex-char string using lookup table
    ; High nibble of high byte
    LDI r21, STR_BUF
    ADDI r21, 192       ; offset string destination

    MOV r8, r28
    LDI r6, 12
    SHR r8, r6
    LDI r6, 0xF
    AND r8, r6
    LDI r6, HEX_TABLE
    ADD r6, r8
    LOAD r13, r6
    STORE r21, r13
    ADDI r21, 1

    ; Nibble 2 (bits 8-11)
    MOV r8, r28
    LDI r6, 8
    SHR r8, r6
    LDI r6, 0xF
    AND r8, r6
    LDI r6, HEX_TABLE
    ADD r6, r8
    LOAD r13, r6
    STORE r21, r13
    ADDI r21, 1

    ; Nibble 1 (bits 4-7)
    MOV r8, r28
    LDI r6, 4
    SHR r8, r6
    LDI r6, 0xF
    AND r8, r6
    LDI r6, HEX_TABLE
    ADD r6, r8
    LOAD r13, r6
    STORE r21, r13
    ADDI r21, 1

    ; Nibble 0 (bits 0-3)
    MOV r8, r28
    LDI r6, 0xF
    AND r8, r6
    LDI r6, HEX_TABLE
    ADD r6, r8
    LOAD r13, r6
    STORE r21, r13
    ADDI r21, 1

    ; Null terminate
    LDI r13, 0
    STORE r21, r13

    ; Draw address
    LDI r1, 4
    LDI r4, STR_BUF
    ADDI r4, 192
    LDI r9, 0x55aaff
    LDI r0, 0x0d1117
    DRAWTEXT r1, r14, r4, r9, r0

    ; ── Draw hex bytes ──
    LDI r29, 0           ; byte counter in row
    LDI r30, 48           ; x start for hex data

hex_byte_loop:
    LDI r12, BYTES_PER_ROW
    CMP r29, r12
    BGE r3, draw_ascii

    ; Check past EOF
    MOV r12, r28
    ADD r12, r29
    LDI r7, FILE_SIZE
    LOAD r7, r7
    CMP r12, r7
    BGE r3, draw_ascii

    ; Load byte
    LDI r12, CONTENT_BUF
    ADD r12, r28
    ADD r12, r29
    LOAD r8, r12

    ; Convert byte to 2 hex chars using lookup table
    LDI r21, STR_BUF
    ADDI r21, 208

    ; High nibble
    MOV r6, r8
    LDI r13, 4
    SHR r6, r13
    LDI r13, 0xF
    AND r6, r13
    LDI r13, HEX_TABLE
    ADD r13, r6
    LOAD r5, r13
    STORE r21, r5
    ADDI r21, 1

    ; Low nibble
    LDI r13, 0xF
    AND r8, r13
    LDI r13, HEX_TABLE
    ADD r13, r8
    LOAD r5, r13
    STORE r21, r5
    ADDI r21, 1

    ; Null terminate
    LDI r5, 0
    STORE r21, r5

    ; Draw hex pair
    MOV r1, r30
    LDI r4, STR_BUF
    ADDI r4, 208
    LDI r9, 0x44dd88
    LDI r0, 0x0d1117
    DRAWTEXT r1, r14, r4, r9, r0

    ADDI r30, 20

    ; Extra gap after 8 bytes
    LDI r12, 8
    CMP r29, r12
    JNZ r3, no_gap
    ADDI r30, 8
no_gap:
    ADDI r29, 1
    JMP hex_byte_loop

draw_ascii:
    ; Draw ASCII representation on right
    LDI r29, 0
    LDI r30, 218           ; x start for ASCII
ascii_loop:
    LDI r12, BYTES_PER_ROW
    CMP r29, r12
    BGE r3, hex_next_row

    MOV r12, r28
    ADD r12, r29
    LDI r7, FILE_SIZE
    LOAD r7, r7
    CMP r12, r7
    BGE r3, hex_next_row

    ; Load byte
    LDI r12, CONTENT_BUF
    ADD r12, r28
    ADD r12, r29
    LOAD r8, r12

    ; Printable check (32-126)
    CMPI r8, 32
    BLT r3, ascii_dot
    CMPI r8, 127
    BGE r3, ascii_dot
    ; Store char
    LDI r21, STR_BUF
    ADDI r21, 224
    STORE r21, r8
    LDI r12, 0
    ADDI r21, 1
    STORE r21, r12
    JMP ascii_draw

ascii_dot:
    LDI r21, STR_BUF
    ADDI r21, 224
    LDI r12, 46
    STORE r21, r12
    LDI r12, 0
    ADDI r21, 1
    STORE r21, r12

ascii_draw:
    MOV r1, r30
    LDI r4, STR_BUF
    ADDI r4, 224
    LDI r9, 0x889999
    LDI r0, 0x0d1117
    DRAWTEXT r1, r14, r4, r9, r0

    ADDI r30, 8
    ADDI r29, 1
    JMP ascii_loop

hex_next_row:
    ADDI r22, 1
    JMP hex_row_loop

; ── HEX FOOTER ────────────────────────────────
hex_footer:
    ; Footer bar
    LDI r10, 0
    LDI r8, 236
    LDI r6, 256
    LDI r13, 20
    LDI r5, 0x1a1f29
    RECTF r10, r8, r6, r13, r5

    ; Show file size
    LDI r20, STR_BUF
    ADDI r20, 240
    STRO r20, "Bytes:"

    ; File size as decimal
    LDI r12, FILE_SIZE
    LOAD r8, r12
    LDI r20, STR_BUF
    ADDI r20, 256

    ; Quick decimal conversion (up to 5 digits)
    LDI r7, 1
    LDI r6, 10000
    MOV r13, r8
    DIV r13, r6
    CMPI r13, 0
    JZ r3, skip10k
    ADDI r13, 48
    STORE r20, r13
    ADD r20, r7
    MOV r13, r8
    MOD r13, r6
    MOV r8, r13
skip10k:
    LDI r6, 1000
    MOV r13, r8
    DIV r13, r6
    CMPI r13, 0
    JZ r3, skip1k
    ADDI r13, 48
    STORE r20, r13
    ADD r20, r7
    MOV r13, r8
    MOD r13, r6
    MOV r8, r13
skip1k:
    LDI r6, 100
    MOV r13, r8
    DIV r13, r6
    CMPI r13, 0
    JZ r3, skip100
    ADDI r13, 48
    STORE r20, r13
    ADD r20, r7
    MOV r13, r8
    MOD r13, r6
    MOV r8, r13
skip100:
    LDI r6, 10
    MOV r13, r8
    DIV r13, r6
    ADDI r13, 48
    STORE r20, r13
    ADD r20, r7
    MOD r8, r6
    ADDI r8, 48
    STORE r20, r8
    ADD r20, r7
    LDI r8, 0
    STORE r20, r8

    ; Draw "Bytes: N"
    LDI r1, 4
    LDI r14, 240
    LDI r4, STR_BUF
    ADDI r4, 240
    LDI r9, 0xaaaaaa
    LDI r0, 0x1a1f29
    DRAWTEXT r1, r14, r4, r9, r0

    ; Scroll hint
    LDI r10, 110
    LDI r8, 240
    LDI r6, STR_BUF
    ADDI r6, 64
    DRAWTEXT r10, r8, r6, r9, r0

    ; ESC hint
    LDI r10, 190
    LDI r8, 240
    LDI r6, STR_BUF
    ADDI r6, 128
    DRAWTEXT r10, r8, r6, r9, r0

; ── HEX INPUT ─────────────────────────────────
hex_input:
    FRAME

    IKEY r1
    CMPI r1, 0
    JZ r3, main_loop

    ; ESC = 27 -- back to list
    CMPI r1, 27
    JNZ r3, not_esc
    LDI r20, MODE
    LDI r8, 0
    STORE r20, r8
    JMP main_loop

not_esc:
    ; W = 87 (up)
    CMPI r1, 87
    JNZ r3, not_hup
    LDI r20, SCROLL_OFF
    LOAD r25, r20
    CMPI r25, 0
    JZ r3, main_loop
    LDI r12, BYTES_PER_ROW
    SUB r25, r12
    STORE r20, r25
    JMP main_loop

not_hup:
    ; S = 83 (down)
    CMPI r1, 83
    JNZ r3, main_loop
    LDI r20, SCROLL_OFF
    LOAD r25, r20
    LDI r12, BYTES_PER_ROW
    ADD r25, r12
    LDI r7, FILE_SIZE
    LOAD r7, r7
    CMP r25, r7
    BGE r3, main_loop
    STORE r20, r25
    JMP main_loop
