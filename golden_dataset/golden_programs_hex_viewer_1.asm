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
LDI r3, 1

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
LDI r1, 0x0d1117
FILL r1

; Mode = list view
LDI r20, MODE
LDI r1, 0
STORE r20, r1

; Selected index = 0
LDI r20, SEL_INDEX
LDI r1, 0
STORE r20, r1

; Scroll offset = 0
LDI r20, SCROLL_OFF
LDI r1, 0
STORE r20, r1

; File size = 0
LDI r20, FILE_SIZE
LDI r1, 0
STORE r20, r1

; ── List files with LS ──
LDI r20, FILE_BUF
LS r20
; r13 = file count
LDI r21, FILE_COUNT
STORE r21, r13

; ── Parse LS buffer: build filename address table ──
LDI r20, FILE_BUF
LDI r22, 0
LDI r23, FNAME_TABLE

scan_loop:
    LDI r4, 16
    CMP r22, r4
    BGE r13, scan_done

    LOAD r1, r20
    CMPI r1, 0
    JZ r13, scan_done

    STORE r23, r20
    ADDI r23, 1

skip_chars:
    LOAD r1, r20
    CMPI r1, 0
    JZ r13, next_entry
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
    LDI r3, 1

    LDI r20, MODE
    LOAD r4, r20
    CMPI r4, 0
    JZ r13, draw_list_view

    JMP draw_hex_view

; ── LIST VIEW ─────────────────────────────────
draw_list_view:
    LDI r1, 0x0d1117
    FILL r1

    ; Title bar
    LDI r3, 0
    LDI r1, 0
    LDI r0, 256
    LDI r10, 22
    LDI r15, 0x1a1f29
    RECTF r3, r1, r0, r10, r15

    ; Title text
    LDI r3, 8
    LDI r1, TITLE_Y
    LDI r0, STR_BUF
    TEXT r3, r1, r0

    ; File count
    LDI r20, FILE_COUNT
    LOAD r1, r20
    LDI r20, STR_BUF
    ADDI r20, 160
    LDI r4, 48
    ADD r4, r1
    STORE r20, r4
    LDI r4, 0
    ADDI r20, 1
    STORE r20, r4
    LDI r3, 200
    LDI r1, TITLE_Y
    LDI r0, STR_BUF
    ADDI r0, 160
    TEXT r3, r1, r0

    ; Instructions
    LDI r3, 8
    LDI r1, 238
    LDI r0, STR_BUF
    ADDI r0, 64
    LDI r6, 0x888899
    LDI r5, 0x0d1117
    DRAWTEXT r3, r1, r0, r6, r5

    ; Draw file rows with selection highlight
    LDI r22, 0
    LDI r23, FNAME_TABLE
    LDI r24, ROW_BASE_Y

draw_rows:
    LDI r4, 16
    CMP r22, r4
    BGE r13, list_input

    LOAD r20, r23
    CMPI r20, 0
    JZ r13, list_input

    ; Check if selected
    LDI r25, SEL_INDEX
    LOAD r25, r25
    CMP r22, r25
    JZ r13, row_selected

    ; Normal row
    LDI r3, 4
    MOV r1, r24
    LDI r0, 248
    LDI r10, ROW_H
    LDI r15, 0x131820
    RECTF r3, r1, r0, r10, r15
    JMP draw_fname

row_selected:
    LDI r3, 4
    MOV r1, r24
    LDI r0, 248
    LDI r10, ROW_H
    LDI r15, 0x1a3a5c
    RECTF r3, r1, r0, r10, r15

    ; Arrow indicator
    LDI r20, STR_BUF
    ADDI r20, 192
    STRO r20, ">"

draw_fname:
    LDI r3, 16
    MOV r1, r24
    ADDI r1, 2
    TEXT r3, r1, r20

    ADDI r22, 1
    ADDI r23, 1
    LDI r4, ROW_H
    ADD r24, r4
    JMP draw_rows

; ── LIST INPUT ────────────────────────────────
list_input:
    FRAME

    IKEY r8
    CMPI r8, 0
    JZ r13, main_loop

    ; W = 87 (up)
    CMPI r8, 87
    JNZ r13, not_up
    LDI r20, SEL_INDEX
    LOAD r25, r20
    CMPI r25, 0
    JZ r13, main_loop
    SUBI r25, 1
    STORE r20, r25
    JMP main_loop

not_up:
    ; S = 83 (down)
    CMPI r8, 83
    JNZ r13, not_down
    LDI r20, SEL_INDEX
    LOAD r25, r20
    LDI r4, FILE_COUNT
    LOAD r4, r4
    SUBI r4, 1
    CMP r25, r4
    BGE r13, main_loop
    ADDI r25, 1
    STORE r20, r25
    JMP main_loop

not_down:
    ; ENTER = 10 or 13
    CMPI r8, 10
    JZ r13, open_selected
    CMPI r8, 13
    JZ r13, open_selected
    JMP main_loop

; ── OPEN SELECTED FILE ────────────────────────
open_selected:
    LDI r23, SEL_INDEX
    LOAD r22, r23
    LDI r23, FNAME_TABLE
    ADD r23, r22
    LOAD r20, r23
    CMPI r20, 0
    JZ r13, main_loop

    ; Reset scroll
    LDI r25, SCROLL_OFF
    LDI r4, 0
    STORE r25, r4

    ; Open
    LDI r4, 0
    OPEN r20, r4
    MOV r19, r13
    CMPI r19, 0xFFFFFFFF
    JZ r13, main_loop

    LDI r21, TEMP_FD
    STORE r21, r19

    ; Read content
    LDI r4, CONTENT_BUF
    LDI r14, 5120
    READ r19, r4, r14
    LDI r21, FILE_SIZE
    STORE r21, r13

    ; Null-terminate
    LDI r20, CONTENT_BUF
    ADD r20, r13
    LDI r1, 0
    STORE r20, r1

    CLOSE r19

    ; Switch to hex view
    LDI r20, MODE
    LDI r1, 1
    STORE r20, r1
    JMP main_loop

; ── HEX VIEW ─────────────────────────────────
draw_hex_view:
    LDI r1, 0x0d1117
    FILL r1

    ; Header bar
    LDI r3, 0
    LDI r1, 0
    LDI r0, 256
    LDI r10, 22
    LDI r15, 0x1a1f29
    RECTF r3, r1, r0, r10, r15

    ; Title
    LDI r3, 8
    LDI r1, TITLE_Y
    LDI r0, STR_BUF
    TEXT r3, r1, r0

    ; Separator line
    LDI r3, 0
    LDI r1, 26
    LDI r0, 256
    LDI r10, 1
    LDI r15, 0x2a3a4a
    RECTF r3, r1, r0, r10, r15

    ; Draw hex dump rows
    LDI r22, 0            ; row counter
    LDI r27, SCROLL_OFF
    LOAD r27, r27         ; byte offset

hex_row_loop:
    LDI r4, MAX_VISIBLE
    CMP r22, r4
    BGE r13, hex_footer

    ; Compute byte offset for this row
    MOV r28, r22
    LDI r4, BYTES_PER_ROW
    MUL r28, r4
    ADD r28, r27

    ; Check past EOF
    LDI r4, FILE_SIZE
    LOAD r4, r4
    CMP r28, r4
    BGE r13, hex_footer

    ; Y position for this row
    MOV r7, r22
    LDI r4, 14
    MUL r7, r4
    ADDI r7, 28

    ; ── Draw address offset ──
    ; Convert r28 to 4-hex-char string using lookup table
    ; High nibble of high byte
    LDI r21, STR_BUF
    ADDI r21, 192       ; offset string destination

    MOV r1, r28
    LDI r0, 12
    SHR r1, r0
    LDI r0, 0xF
    AND r1, r0
    LDI r0, HEX_TABLE
    ADD r0, r1
    LOAD r10, r0
    STORE r21, r10
    ADDI r21, 1

    ; Nibble 2 (bits 8-11)
    MOV r1, r28
    LDI r0, 8
    SHR r1, r0
    LDI r0, 0xF
    AND r1, r0
    LDI r0, HEX_TABLE
    ADD r0, r1
    LOAD r10, r0
    STORE r21, r10
    ADDI r21, 1

    ; Nibble 1 (bits 4-7)
    MOV r1, r28
    LDI r0, 4
    SHR r1, r0
    LDI r0, 0xF
    AND r1, r0
    LDI r0, HEX_TABLE
    ADD r0, r1
    LOAD r10, r0
    STORE r21, r10
    ADDI r21, 1

    ; Nibble 0 (bits 0-3)
    MOV r1, r28
    LDI r0, 0xF
    AND r1, r0
    LDI r0, HEX_TABLE
    ADD r0, r1
    LOAD r10, r0
    STORE r21, r10
    ADDI r21, 1

    ; Null terminate
    LDI r10, 0
    STORE r21, r10

    ; Draw address
    LDI r8, 4
    LDI r9, STR_BUF
    ADDI r9, 192
    LDI r6, 0x55aaff
    LDI r5, 0x0d1117
    DRAWTEXT r8, r7, r9, r6, r5

    ; ── Draw hex bytes ──
    LDI r29, 0           ; byte counter in row
    LDI r30, 48           ; x start for hex data

hex_byte_loop:
    LDI r4, BYTES_PER_ROW
    CMP r29, r4
    BGE r13, draw_ascii

    ; Check past EOF
    MOV r4, r28
    ADD r4, r29
    LDI r14, FILE_SIZE
    LOAD r14, r14
    CMP r4, r14
    BGE r13, draw_ascii

    ; Load byte
    LDI r4, CONTENT_BUF
    ADD r4, r28
    ADD r4, r29
    LOAD r1, r4

    ; Convert byte to 2 hex chars using lookup table
    LDI r21, STR_BUF
    ADDI r21, 208

    ; High nibble
    MOV r0, r1
    LDI r10, 4
    SHR r0, r10
    LDI r10, 0xF
    AND r0, r10
    LDI r10, HEX_TABLE
    ADD r10, r0
    LOAD r15, r10
    STORE r21, r15
    ADDI r21, 1

    ; Low nibble
    LDI r10, 0xF
    AND r1, r10
    LDI r10, HEX_TABLE
    ADD r10, r1
    LOAD r15, r10
    STORE r21, r15
    ADDI r21, 1

    ; Null terminate
    LDI r15, 0
    STORE r21, r15

    ; Draw hex pair
    MOV r8, r30
    LDI r9, STR_BUF
    ADDI r9, 208
    LDI r6, 0x44dd88
    LDI r5, 0x0d1117
    DRAWTEXT r8, r7, r9, r6, r5

    ADDI r30, 20

    ; Extra gap after 8 bytes
    LDI r4, 8
    CMP r29, r4
    JNZ r13, no_gap
    ADDI r30, 8
no_gap:
    ADDI r29, 1
    JMP hex_byte_loop

draw_ascii:
    ; Draw ASCII representation on right
    LDI r29, 0
    LDI r30, 218           ; x start for ASCII
ascii_loop:
    LDI r4, BYTES_PER_ROW
    CMP r29, r4
    BGE r13, hex_next_row

    MOV r4, r28
    ADD r4, r29
    LDI r14, FILE_SIZE
    LOAD r14, r14
    CMP r4, r14
    BGE r13, hex_next_row

    ; Load byte
    LDI r4, CONTENT_BUF
    ADD r4, r28
    ADD r4, r29
    LOAD r1, r4

    ; Printable check (32-126)
    CMPI r1, 32
    BLT r13, ascii_dot
    CMPI r1, 127
    BGE r13, ascii_dot
    ; Store char
    LDI r21, STR_BUF
    ADDI r21, 224
    STORE r21, r1
    LDI r4, 0
    ADDI r21, 1
    STORE r21, r4
    JMP ascii_draw

ascii_dot:
    LDI r21, STR_BUF
    ADDI r21, 224
    LDI r4, 46
    STORE r21, r4
    LDI r4, 0
    ADDI r21, 1
    STORE r21, r4

ascii_draw:
    MOV r8, r30
    LDI r9, STR_BUF
    ADDI r9, 224
    LDI r6, 0x889999
    LDI r5, 0x0d1117
    DRAWTEXT r8, r7, r9, r6, r5

    ADDI r30, 8
    ADDI r29, 1
    JMP ascii_loop

hex_next_row:
    ADDI r22, 1
    JMP hex_row_loop

; ── HEX FOOTER ────────────────────────────────
hex_footer:
    ; Footer bar
    LDI r3, 0
    LDI r1, 236
    LDI r0, 256
    LDI r10, 20
    LDI r15, 0x1a1f29
    RECTF r3, r1, r0, r10, r15

    ; Show file size
    LDI r20, STR_BUF
    ADDI r20, 240
    STRO r20, "Bytes:"

    ; File size as decimal
    LDI r4, FILE_SIZE
    LOAD r1, r4
    LDI r20, STR_BUF
    ADDI r20, 256

    ; Quick decimal conversion (up to 5 digits)
    LDI r14, 1
    LDI r0, 10000
    MOV r10, r1
    DIV r10, r0
    CMPI r10, 0
    JZ r13, skip10k
    ADDI r10, 48
    STORE r20, r10
    ADD r20, r14
    MOV r10, r1
    MOD r10, r0
    MOV r1, r10
skip10k:
    LDI r0, 1000
    MOV r10, r1
    DIV r10, r0
    CMPI r10, 0
    JZ r13, skip1k
    ADDI r10, 48
    STORE r20, r10
    ADD r20, r14
    MOV r10, r1
    MOD r10, r0
    MOV r1, r10
skip1k:
    LDI r0, 100
    MOV r10, r1
    DIV r10, r0
    CMPI r10, 0
    JZ r13, skip100
    ADDI r10, 48
    STORE r20, r10
    ADD r20, r14
    MOV r10, r1
    MOD r10, r0
    MOV r1, r10
skip100:
    LDI r0, 10
    MOV r10, r1
    DIV r10, r0
    ADDI r10, 48
    STORE r20, r10
    ADD r20, r14
    MOD r1, r0
    ADDI r1, 48
    STORE r20, r1
    ADD r20, r14
    LDI r1, 0
    STORE r20, r1

    ; Draw "Bytes: N"
    LDI r8, 4
    LDI r7, 240
    LDI r9, STR_BUF
    ADDI r9, 240
    LDI r6, 0xaaaaaa
    LDI r5, 0x1a1f29
    DRAWTEXT r8, r7, r9, r6, r5

    ; Scroll hint
    LDI r3, 110
    LDI r1, 240
    LDI r0, STR_BUF
    ADDI r0, 64
    DRAWTEXT r3, r1, r0, r6, r5

    ; ESC hint
    LDI r3, 190
    LDI r1, 240
    LDI r0, STR_BUF
    ADDI r0, 128
    DRAWTEXT r3, r1, r0, r6, r5

; ── HEX INPUT ─────────────────────────────────
hex_input:
    FRAME

    IKEY r8
    CMPI r8, 0
    JZ r13, main_loop

    ; ESC = 27 -- back to list
    CMPI r8, 27
    JNZ r13, not_esc
    LDI r20, MODE
    LDI r1, 0
    STORE r20, r1
    JMP main_loop

not_esc:
    ; W = 87 (up)
    CMPI r8, 87
    JNZ r13, not_hup
    LDI r20, SCROLL_OFF
    LOAD r25, r20
    CMPI r25, 0
    JZ r13, main_loop
    LDI r4, BYTES_PER_ROW
    SUB r25, r4
    STORE r20, r25
    JMP main_loop

not_hup:
    ; S = 83 (down)
    CMPI r8, 83
    JNZ r13, main_loop
    LDI r20, SCROLL_OFF
    LOAD r25, r20
    LDI r4, BYTES_PER_ROW
    ADD r25, r4
    LDI r14, FILE_SIZE
    LOAD r14, r14
    CMP r25, r14
    BGE r13, main_loop
    STORE r20, r25
    JMP main_loop
