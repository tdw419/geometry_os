; DESCRIPTION: Display a object using color colored at the screen.

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
LDI r2, 1

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
LDI r0, 0x0d1117
FILL r0

; Mode = list view
LDI r20, MODE
LDI r0, 0
STORE r20, r0

; Selected index = 0
LDI r20, SEL_INDEX
LDI r0, 0
STORE r20, r0

; Scroll offset = 0
LDI r20, SCROLL_OFF
LDI r0, 0
STORE r20, r0

; File size = 0
LDI r20, FILE_SIZE
LDI r0, 0
STORE r20, r0

; ── List files with LS ──
LDI r20, FILE_BUF
LS r20
; r5 = file count
LDI r21, FILE_COUNT
STORE r21, r5

; ── Parse LS buffer: build filename address table ──
LDI r20, FILE_BUF
LDI r22, 0
LDI r23, FNAME_TABLE

scan_loop:
    LDI r6, 16
    CMP r22, r6
    BGE r5, scan_done

    LOAD r0, r20
    CMPI r0, 0
    JZ r5, scan_done

    STORE r23, r20
    ADDI r23, 1

skip_chars:
    LOAD r0, r20
    CMPI r0, 0
    JZ r5, next_entry
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
    LDI r2, 1

    LDI r20, MODE
    LOAD r6, r20
    CMPI r6, 0
    JZ r5, draw_list_view

    JMP draw_hex_view

; ── LIST VIEW ─────────────────────────────────
draw_list_view:
    LDI r0, 0x0d1117
    FILL r0

    ; Title bar
    LDI r2, 0
    LDI r0, 0
    LDI r4, 256
    LDI r9, 22
    LDI r11, 0x1a1f29
    RECTF r2, r0, r4, r9, r11

    ; Title text
    LDI r2, 8
    LDI r0, TITLE_Y
    LDI r4, STR_BUF
    TEXT r2, r0, r4

    ; File count
    LDI r20, FILE_COUNT
    LOAD r0, r20
    LDI r20, STR_BUF
    ADDI r20, 160
    LDI r6, 48
    ADD r6, r0
    STORE r20, r6
    LDI r6, 0
    ADDI r20, 1
    STORE r20, r6
    LDI r2, 200
    LDI r0, TITLE_Y
    LDI r4, STR_BUF
    ADDI r4, 160
    TEXT r2, r0, r4

    ; Instructions
    LDI r2, 8
    LDI r0, 238
    LDI r4, STR_BUF
    ADDI r4, 64
    LDI r3, 0x888899
    LDI r14, 0x0d1117
    DRAWTEXT r2, r0, r4, r3, r14

    ; Draw file rows with selection highlight
    LDI r22, 0
    LDI r23, FNAME_TABLE
    LDI r24, ROW_BASE_Y

draw_rows:
    LDI r6, 16
    CMP r22, r6
    BGE r5, list_input

    LOAD r20, r23
    CMPI r20, 0
    JZ r5, list_input

    ; Check if selected
    LDI r25, SEL_INDEX
    LOAD r25, r25
    CMP r22, r25
    JZ r5, row_selected

    ; Normal row
    LDI r2, 4
    MOV r0, r24
    LDI r4, 248
    LDI r9, ROW_H
    LDI r11, 0x131820
    RECTF r2, r0, r4, r9, r11
    JMP draw_fname

row_selected:
    LDI r2, 4
    MOV r0, r24
    LDI r4, 248
    LDI r9, ROW_H
    LDI r11, 0x1a3a5c
    RECTF r2, r0, r4, r9, r11

    ; Arrow indicator
    LDI r20, STR_BUF
    ADDI r20, 192
    STRO r20, ">"

draw_fname:
    LDI r2, 16
    MOV r0, r24
    ADDI r0, 2
    TEXT r2, r0, r20

    ADDI r22, 1
    ADDI r23, 1
    LDI r6, ROW_H
    ADD r24, r6
    JMP draw_rows

; ── LIST INPUT ────────────────────────────────
list_input:
    FRAME

    IKEY r13
    CMPI r13, 0
    JZ r5, main_loop

    ; W = 87 (up)
    CMPI r13, 87
    JNZ r5, not_up
    LDI r20, SEL_INDEX
    LOAD r25, r20
    CMPI r25, 0
    JZ r5, main_loop
    SUBI r25, 1
    STORE r20, r25
    JMP main_loop

not_up:
    ; S = 83 (down)
    CMPI r13, 83
    JNZ r5, not_down
    LDI r20, SEL_INDEX
    LOAD r25, r20
    LDI r6, FILE_COUNT
    LOAD r6, r6
    SUBI r6, 1
    CMP r25, r6
    BGE r5, main_loop
    ADDI r25, 1
    STORE r20, r25
    JMP main_loop

not_down:
    ; ENTER = 10 or 13
    CMPI r13, 10
    JZ r5, open_selected
    CMPI r13, 13
    JZ r5, open_selected
    JMP main_loop

; ── OPEN SELECTED FILE ────────────────────────
open_selected:
    LDI r23, SEL_INDEX
    LOAD r22, r23
    LDI r23, FNAME_TABLE
    ADD r23, r22
    LOAD r20, r23
    CMPI r20, 0
    JZ r5, main_loop

    ; Reset scroll
    LDI r25, SCROLL_OFF
    LDI r6, 0
    STORE r25, r6

    ; Open
    LDI r6, 0
    OPEN r20, r6
    MOV r19, r5
    CMPI r19, 0xFFFFFFFF
    JZ r5, main_loop

    LDI r21, TEMP_FD
    STORE r21, r19

    ; Read content
    LDI r6, CONTENT_BUF
    LDI r10, 5120
    READ r19, r6, r10
    LDI r21, FILE_SIZE
    STORE r21, r5

    ; Null-terminate
    LDI r20, CONTENT_BUF
    ADD r20, r5
    LDI r0, 0
    STORE r20, r0

    CLOSE r19

    ; Switch to hex view
    LDI r20, MODE
    LDI r0, 1
    STORE r20, r0
    JMP main_loop

; ── HEX VIEW ─────────────────────────────────
draw_hex_view:
    LDI r0, 0x0d1117
    FILL r0

    ; Header bar
    LDI r2, 0
    LDI r0, 0
    LDI r4, 256
    LDI r9, 22
    LDI r11, 0x1a1f29
    RECTF r2, r0, r4, r9, r11

    ; Title
    LDI r2, 8
    LDI r0, TITLE_Y
    LDI r4, STR_BUF
    TEXT r2, r0, r4

    ; Separator line
    LDI r2, 0
    LDI r0, 26
    LDI r4, 256
    LDI r9, 1
    LDI r11, 0x2a3a4a
    RECTF r2, r0, r4, r9, r11

    ; Draw hex dump rows
    LDI r22, 0            ; row counter
    LDI r27, SCROLL_OFF
    LOAD r27, r27         ; byte offset

hex_row_loop:
    LDI r6, MAX_VISIBLE
    CMP r22, r6
    BGE r5, hex_footer

    ; Compute byte offset for this row
    MOV r28, r22
    LDI r6, BYTES_PER_ROW
    MUL r28, r6
    ADD r28, r27

    ; Check past EOF
    LDI r6, FILE_SIZE
    LOAD r6, r6
    CMP r28, r6
    BGE r5, hex_footer

    ; Y position for this row
    MOV r7, r22
    LDI r6, 14
    MUL r7, r6
    ADDI r7, 28

    ; ── Draw address offset ──
    ; Convert r28 to 4-hex-char string using lookup table
    ; High nibble of high byte
    LDI r21, STR_BUF
    ADDI r21, 192       ; offset string destination

    MOV r0, r28
    LDI r4, 12
    SHR r0, r4
    LDI r4, 0xF
    AND r0, r4
    LDI r4, HEX_TABLE
    ADD r4, r0
    LOAD r9, r4
    STORE r21, r9
    ADDI r21, 1

    ; Nibble 2 (bits 8-11)
    MOV r0, r28
    LDI r4, 8
    SHR r0, r4
    LDI r4, 0xF
    AND r0, r4
    LDI r4, HEX_TABLE
    ADD r4, r0
    LOAD r9, r4
    STORE r21, r9
    ADDI r21, 1

    ; Nibble 1 (bits 4-7)
    MOV r0, r28
    LDI r4, 4
    SHR r0, r4
    LDI r4, 0xF
    AND r0, r4
    LDI r4, HEX_TABLE
    ADD r4, r0
    LOAD r9, r4
    STORE r21, r9
    ADDI r21, 1

    ; Nibble 0 (bits 0-3)
    MOV r0, r28
    LDI r4, 0xF
    AND r0, r4
    LDI r4, HEX_TABLE
    ADD r4, r0
    LOAD r9, r4
    STORE r21, r9
    ADDI r21, 1

    ; Null terminate
    LDI r9, 0
    STORE r21, r9

    ; Draw address
    LDI r13, 4
    LDI r12, STR_BUF
    ADDI r12, 192
    LDI r3, 0x55aaff
    LDI r14, 0x0d1117
    DRAWTEXT r13, r7, r12, r3, r14

    ; ── Draw hex bytes ──
    LDI r29, 0           ; byte counter in row
    LDI r30, 48           ; x start for hex data

hex_byte_loop:
    LDI r6, BYTES_PER_ROW
    CMP r29, r6
    BGE r5, draw_ascii

    ; Check past EOF
    MOV r6, r28
    ADD r6, r29
    LDI r10, FILE_SIZE
    LOAD r10, r10
    CMP r6, r10
    BGE r5, draw_ascii

    ; Load byte
    LDI r6, CONTENT_BUF
    ADD r6, r28
    ADD r6, r29
    LOAD r0, r6

    ; Convert byte to 2 hex chars using lookup table
    LDI r21, STR_BUF
    ADDI r21, 208

    ; High nibble
    MOV r4, r0
    LDI r9, 4
    SHR r4, r9
    LDI r9, 0xF
    AND r4, r9
    LDI r9, HEX_TABLE
    ADD r9, r4
    LOAD r11, r9
    STORE r21, r11
    ADDI r21, 1

    ; Low nibble
    LDI r9, 0xF
    AND r0, r9
    LDI r9, HEX_TABLE
    ADD r9, r0
    LOAD r11, r9
    STORE r21, r11
    ADDI r21, 1

    ; Null terminate
    LDI r11, 0
    STORE r21, r11

    ; Draw hex pair
    MOV r13, r30
    LDI r12, STR_BUF
    ADDI r12, 208
    LDI r3, 0x44dd88
    LDI r14, 0x0d1117
    DRAWTEXT r13, r7, r12, r3, r14

    ADDI r30, 20

    ; Extra gap after 8 bytes
    LDI r6, 8
    CMP r29, r6
    JNZ r5, no_gap
    ADDI r30, 8
no_gap:
    ADDI r29, 1
    JMP hex_byte_loop

draw_ascii:
    ; Draw ASCII representation on right
    LDI r29, 0
    LDI r30, 218           ; x start for ASCII
ascii_loop:
    LDI r6, BYTES_PER_ROW
    CMP r29, r6
    BGE r5, hex_next_row

    MOV r6, r28
    ADD r6, r29
    LDI r10, FILE_SIZE
    LOAD r10, r10
    CMP r6, r10
    BGE r5, hex_next_row

    ; Load byte
    LDI r6, CONTENT_BUF
    ADD r6, r28
    ADD r6, r29
    LOAD r0, r6

    ; Printable check (32-126)
    CMPI r0, 32
    BLT r5, ascii_dot
    CMPI r0, 127
    BGE r5, ascii_dot
    ; Store char
    LDI r21, STR_BUF
    ADDI r21, 224
    STORE r21, r0
    LDI r6, 0
    ADDI r21, 1
    STORE r21, r6
    JMP ascii_draw

ascii_dot:
    LDI r21, STR_BUF
    ADDI r21, 224
    LDI r6, 46
    STORE r21, r6
    LDI r6, 0
    ADDI r21, 1
    STORE r21, r6

ascii_draw:
    MOV r13, r30
    LDI r12, STR_BUF
    ADDI r12, 224
    LDI r3, 0x889999
    LDI r14, 0x0d1117
    DRAWTEXT r13, r7, r12, r3, r14

    ADDI r30, 8
    ADDI r29, 1
    JMP ascii_loop

hex_next_row:
    ADDI r22, 1
    JMP hex_row_loop

; ── HEX FOOTER ────────────────────────────────
hex_footer:
    ; Footer bar
    LDI r2, 0
    LDI r0, 236
    LDI r4, 256
    LDI r9, 20
    LDI r11, 0x1a1f29
    RECTF r2, r0, r4, r9, r11

    ; Show file size
    LDI r20, STR_BUF
    ADDI r20, 240
    STRO r20, "Bytes:"

    ; File size as decimal
    LDI r6, FILE_SIZE
    LOAD r0, r6
    LDI r20, STR_BUF
    ADDI r20, 256

    ; Quick decimal conversion (up to 5 digits)
    LDI r10, 1
    LDI r4, 10000
    MOV r9, r0
    DIV r9, r4
    CMPI r9, 0
    JZ r5, skip10k
    ADDI r9, 48
    STORE r20, r9
    ADD r20, r10
    MOV r9, r0
    MOD r9, r4
    MOV r0, r9
skip10k:
    LDI r4, 1000
    MOV r9, r0
    DIV r9, r4
    CMPI r9, 0
    JZ r5, skip1k
    ADDI r9, 48
    STORE r20, r9
    ADD r20, r10
    MOV r9, r0
    MOD r9, r4
    MOV r0, r9
skip1k:
    LDI r4, 100
    MOV r9, r0
    DIV r9, r4
    CMPI r9, 0
    JZ r5, skip100
    ADDI r9, 48
    STORE r20, r9
    ADD r20, r10
    MOV r9, r0
    MOD r9, r4
    MOV r0, r9
skip100:
    LDI r4, 10
    MOV r9, r0
    DIV r9, r4
    ADDI r9, 48
    STORE r20, r9
    ADD r20, r10
    MOD r0, r4
    ADDI r0, 48
    STORE r20, r0
    ADD r20, r10
    LDI r0, 0
    STORE r20, r0

    ; Draw "Bytes: N"
    LDI r13, 4
    LDI r7, 240
    LDI r12, STR_BUF
    ADDI r12, 240
    LDI r3, 0xaaaaaa
    LDI r14, 0x1a1f29
    DRAWTEXT r13, r7, r12, r3, r14

    ; Scroll hint
    LDI r2, 110
    LDI r0, 240
    LDI r4, STR_BUF
    ADDI r4, 64
    DRAWTEXT r2, r0, r4, r3, r14

    ; ESC hint
    LDI r2, 190
    LDI r0, 240
    LDI r4, STR_BUF
    ADDI r4, 128
    DRAWTEXT r2, r0, r4, r3, r14

; ── HEX INPUT ─────────────────────────────────
hex_input:
    FRAME

    IKEY r13
    CMPI r13, 0
    JZ r5, main_loop

    ; ESC = 27 -- back to list
    CMPI r13, 27
    JNZ r5, not_esc
    LDI r20, MODE
    LDI r0, 0
    STORE r20, r0
    JMP main_loop

not_esc:
    ; W = 87 (up)
    CMPI r13, 87
    JNZ r5, not_hup
    LDI r20, SCROLL_OFF
    LOAD r25, r20
    CMPI r25, 0
    JZ r5, main_loop
    LDI r6, BYTES_PER_ROW
    SUB r25, r6
    STORE r20, r25
    JMP main_loop

not_hup:
    ; S = 83 (down)
    CMPI r13, 83
    JNZ r5, main_loop
    LDI r20, SCROLL_OFF
    LOAD r25, r20
    LDI r6, BYTES_PER_ROW
    ADD r25, r6
    LDI r10, FILE_SIZE
    LOAD r10, r10
    CMP r25, r10
    BGE r5, main_loop
    STORE r20, r25
    JMP main_loop
