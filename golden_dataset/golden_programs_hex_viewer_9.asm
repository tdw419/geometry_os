; DESCRIPTION: Render a colored object at the screen.

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
LDI r13, 0x0d1117
FILL r13

; Mode = list view
LDI r20, MODE
LDI r13, 0
STORE r20, r13

; Selected index = 0
LDI r20, SEL_INDEX
LDI r13, 0
STORE r20, r13

; Scroll offset = 0
LDI r20, SCROLL_OFF
LDI r13, 0
STORE r20, r13

; File size = 0
LDI r20, FILE_SIZE
LDI r13, 0
STORE r20, r13

; ── List files with LS ──
LDI r20, FILE_BUF
LS r20
; r14 = file count
LDI r21, FILE_COUNT
STORE r21, r14

; ── Parse LS buffer: build filename address table ──
LDI r20, FILE_BUF
LDI r22, 0
LDI r23, FNAME_TABLE

scan_loop:
    LDI r4, 16
    CMP r22, r4
    BGE r14, scan_done

    LOAD r13, r20
    CMPI r13, 0
    JZ r14, scan_done

    STORE r23, r20
    ADDI r23, 1

skip_chars:
    LOAD r13, r20
    CMPI r13, 0
    JZ r14, next_entry
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
    LOAD r4, r20
    CMPI r4, 0
    JZ r14, draw_list_view

    JMP draw_hex_view

; ── LIST VIEW ─────────────────────────────────
draw_list_view:
    LDI r13, 0x0d1117
    FILL r13

    ; Title bar
    LDI r12, 0
    LDI r13, 0
    LDI r10, 256
    LDI r8, 22
    LDI r5, 0x1a1f29
    RECTF r12, r13, r10, r8, r5

    ; Title text
    LDI r12, 8
    LDI r13, TITLE_Y
    LDI r10, STR_BUF
    TEXT r12, r13, r10

    ; File count
    LDI r20, FILE_COUNT
    LOAD r13, r20
    LDI r20, STR_BUF
    ADDI r20, 160
    LDI r4, 48
    ADD r4, r13
    STORE r20, r4
    LDI r4, 0
    ADDI r20, 1
    STORE r20, r4
    LDI r12, 200
    LDI r13, TITLE_Y
    LDI r10, STR_BUF
    ADDI r10, 160
    TEXT r12, r13, r10

    ; Instructions
    LDI r12, 8
    LDI r13, 238
    LDI r10, STR_BUF
    ADDI r10, 64
    LDI r7, 0x888899
    LDI r15, 0x0d1117
    DRAWTEXT r12, r13, r10, r7, r15

    ; Draw file rows with selection highlight
    LDI r22, 0
    LDI r23, FNAME_TABLE
    LDI r24, ROW_BASE_Y

draw_rows:
    LDI r4, 16
    CMP r22, r4
    BGE r14, list_input

    LOAD r20, r23
    CMPI r20, 0
    JZ r14, list_input

    ; Check if selected
    LDI r25, SEL_INDEX
    LOAD r25, r25
    CMP r22, r25
    JZ r14, row_selected

    ; Normal row
    LDI r12, 4
    MOV r13, r24
    LDI r10, 248
    LDI r8, ROW_H
    LDI r5, 0x131820
    RECTF r12, r13, r10, r8, r5
    JMP draw_fname

row_selected:
    LDI r12, 4
    MOV r13, r24
    LDI r10, 248
    LDI r8, ROW_H
    LDI r5, 0x1a3a5c
    RECTF r12, r13, r10, r8, r5

    ; Arrow indicator
    LDI r20, STR_BUF
    ADDI r20, 192
    STRO r20, ">"

draw_fname:
    LDI r12, 16
    MOV r13, r24
    ADDI r13, 2
    TEXT r12, r13, r20

    ADDI r22, 1
    ADDI r23, 1
    LDI r4, ROW_H
    ADD r24, r4
    JMP draw_rows

; ── LIST INPUT ────────────────────────────────
list_input:
    FRAME

    IKEY r2
    CMPI r2, 0
    JZ r14, main_loop

    ; W = 87 (up)
    CMPI r2, 87
    JNZ r14, not_up
    LDI r20, SEL_INDEX
    LOAD r25, r20
    CMPI r25, 0
    JZ r14, main_loop
    SUBI r25, 1
    STORE r20, r25
    JMP main_loop

not_up:
    ; S = 83 (down)
    CMPI r2, 83
    JNZ r14, not_down
    LDI r20, SEL_INDEX
    LOAD r25, r20
    LDI r4, FILE_COUNT
    LOAD r4, r4
    SUBI r4, 1
    CMP r25, r4
    BGE r14, main_loop
    ADDI r25, 1
    STORE r20, r25
    JMP main_loop

not_down:
    ; ENTER = 10 or 13
    CMPI r2, 10
    JZ r14, open_selected
    CMPI r2, 13
    JZ r14, open_selected
    JMP main_loop

; ── OPEN SELECTED FILE ────────────────────────
open_selected:
    LDI r23, SEL_INDEX
    LOAD r22, r23
    LDI r23, FNAME_TABLE
    ADD r23, r22
    LOAD r20, r23
    CMPI r20, 0
    JZ r14, main_loop

    ; Reset scroll
    LDI r25, SCROLL_OFF
    LDI r4, 0
    STORE r25, r4

    ; Open
    LDI r4, 0
    OPEN r20, r4
    MOV r19, r14
    CMPI r19, 0xFFFFFFFF
    JZ r14, main_loop

    LDI r21, TEMP_FD
    STORE r21, r19

    ; Read content
    LDI r4, CONTENT_BUF
    LDI r1, 5120
    READ r19, r4, r1
    LDI r21, FILE_SIZE
    STORE r21, r14

    ; Null-terminate
    LDI r20, CONTENT_BUF
    ADD r20, r14
    LDI r13, 0
    STORE r20, r13

    CLOSE r19

    ; Switch to hex view
    LDI r20, MODE
    LDI r13, 1
    STORE r20, r13
    JMP main_loop

; ── HEX VIEW ─────────────────────────────────
draw_hex_view:
    LDI r13, 0x0d1117
    FILL r13

    ; Header bar
    LDI r12, 0
    LDI r13, 0
    LDI r10, 256
    LDI r8, 22
    LDI r5, 0x1a1f29
    RECTF r12, r13, r10, r8, r5

    ; Title
    LDI r12, 8
    LDI r13, TITLE_Y
    LDI r10, STR_BUF
    TEXT r12, r13, r10

    ; Separator line
    LDI r12, 0
    LDI r13, 26
    LDI r10, 256
    LDI r8, 1
    LDI r5, 0x2a3a4a
    RECTF r12, r13, r10, r8, r5

    ; Draw hex dump rows
    LDI r22, 0            ; row counter
    LDI r27, SCROLL_OFF
    LOAD r27, r27         ; byte offset

hex_row_loop:
    LDI r4, MAX_VISIBLE
    CMP r22, r4
    BGE r14, hex_footer

    ; Compute byte offset for this row
    MOV r28, r22
    LDI r4, BYTES_PER_ROW
    MUL r28, r4
    ADD r28, r27

    ; Check past EOF
    LDI r4, FILE_SIZE
    LOAD r4, r4
    CMP r28, r4
    BGE r14, hex_footer

    ; Y position for this row
    MOV r0, r22
    LDI r4, 14
    MUL r0, r4
    ADDI r0, 28

    ; ── Draw address offset ──
    ; Convert r28 to 4-hex-char string using lookup table
    ; High nibble of high byte
    LDI r21, STR_BUF
    ADDI r21, 192       ; offset string destination

    MOV r13, r28
    LDI r10, 12
    SHR r13, r10
    LDI r10, 0xF
    AND r13, r10
    LDI r10, HEX_TABLE
    ADD r10, r13
    LOAD r8, r10
    STORE r21, r8
    ADDI r21, 1

    ; Nibble 2 (bits 8-11)
    MOV r13, r28
    LDI r10, 8
    SHR r13, r10
    LDI r10, 0xF
    AND r13, r10
    LDI r10, HEX_TABLE
    ADD r10, r13
    LOAD r8, r10
    STORE r21, r8
    ADDI r21, 1

    ; Nibble 1 (bits 4-7)
    MOV r13, r28
    LDI r10, 4
    SHR r13, r10
    LDI r10, 0xF
    AND r13, r10
    LDI r10, HEX_TABLE
    ADD r10, r13
    LOAD r8, r10
    STORE r21, r8
    ADDI r21, 1

    ; Nibble 0 (bits 0-3)
    MOV r13, r28
    LDI r10, 0xF
    AND r13, r10
    LDI r10, HEX_TABLE
    ADD r10, r13
    LOAD r8, r10
    STORE r21, r8
    ADDI r21, 1

    ; Null terminate
    LDI r8, 0
    STORE r21, r8

    ; Draw address
    LDI r2, 4
    LDI r3, STR_BUF
    ADDI r3, 192
    LDI r7, 0x55aaff
    LDI r15, 0x0d1117
    DRAWTEXT r2, r0, r3, r7, r15

    ; ── Draw hex bytes ──
    LDI r29, 0           ; byte counter in row
    LDI r30, 48           ; x start for hex data

hex_byte_loop:
    LDI r4, BYTES_PER_ROW
    CMP r29, r4
    BGE r14, draw_ascii

    ; Check past EOF
    MOV r4, r28
    ADD r4, r29
    LDI r1, FILE_SIZE
    LOAD r1, r1
    CMP r4, r1
    BGE r14, draw_ascii

    ; Load byte
    LDI r4, CONTENT_BUF
    ADD r4, r28
    ADD r4, r29
    LOAD r13, r4

    ; Convert byte to 2 hex chars using lookup table
    LDI r21, STR_BUF
    ADDI r21, 208

    ; High nibble
    MOV r10, r13
    LDI r8, 4
    SHR r10, r8
    LDI r8, 0xF
    AND r10, r8
    LDI r8, HEX_TABLE
    ADD r8, r10
    LOAD r5, r8
    STORE r21, r5
    ADDI r21, 1

    ; Low nibble
    LDI r8, 0xF
    AND r13, r8
    LDI r8, HEX_TABLE
    ADD r8, r13
    LOAD r5, r8
    STORE r21, r5
    ADDI r21, 1

    ; Null terminate
    LDI r5, 0
    STORE r21, r5

    ; Draw hex pair
    MOV r2, r30
    LDI r3, STR_BUF
    ADDI r3, 208
    LDI r7, 0x44dd88
    LDI r15, 0x0d1117
    DRAWTEXT r2, r0, r3, r7, r15

    ADDI r30, 20

    ; Extra gap after 8 bytes
    LDI r4, 8
    CMP r29, r4
    JNZ r14, no_gap
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
    BGE r14, hex_next_row

    MOV r4, r28
    ADD r4, r29
    LDI r1, FILE_SIZE
    LOAD r1, r1
    CMP r4, r1
    BGE r14, hex_next_row

    ; Load byte
    LDI r4, CONTENT_BUF
    ADD r4, r28
    ADD r4, r29
    LOAD r13, r4

    ; Printable check (32-126)
    CMPI r13, 32
    BLT r14, ascii_dot
    CMPI r13, 127
    BGE r14, ascii_dot
    ; Store char
    LDI r21, STR_BUF
    ADDI r21, 224
    STORE r21, r13
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
    MOV r2, r30
    LDI r3, STR_BUF
    ADDI r3, 224
    LDI r7, 0x889999
    LDI r15, 0x0d1117
    DRAWTEXT r2, r0, r3, r7, r15

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
    LDI r13, 236
    LDI r10, 256
    LDI r8, 20
    LDI r5, 0x1a1f29
    RECTF r12, r13, r10, r8, r5

    ; Show file size
    LDI r20, STR_BUF
    ADDI r20, 240
    STRO r20, "Bytes:"

    ; File size as decimal
    LDI r4, FILE_SIZE
    LOAD r13, r4
    LDI r20, STR_BUF
    ADDI r20, 256

    ; Quick decimal conversion (up to 5 digits)
    LDI r1, 1
    LDI r10, 10000
    MOV r8, r13
    DIV r8, r10
    CMPI r8, 0
    JZ r14, skip10k
    ADDI r8, 48
    STORE r20, r8
    ADD r20, r1
    MOV r8, r13
    MOD r8, r10
    MOV r13, r8
skip10k:
    LDI r10, 1000
    MOV r8, r13
    DIV r8, r10
    CMPI r8, 0
    JZ r14, skip1k
    ADDI r8, 48
    STORE r20, r8
    ADD r20, r1
    MOV r8, r13
    MOD r8, r10
    MOV r13, r8
skip1k:
    LDI r10, 100
    MOV r8, r13
    DIV r8, r10
    CMPI r8, 0
    JZ r14, skip100
    ADDI r8, 48
    STORE r20, r8
    ADD r20, r1
    MOV r8, r13
    MOD r8, r10
    MOV r13, r8
skip100:
    LDI r10, 10
    MOV r8, r13
    DIV r8, r10
    ADDI r8, 48
    STORE r20, r8
    ADD r20, r1
    MOD r13, r10
    ADDI r13, 48
    STORE r20, r13
    ADD r20, r1
    LDI r13, 0
    STORE r20, r13

    ; Draw "Bytes: N"
    LDI r2, 4
    LDI r0, 240
    LDI r3, STR_BUF
    ADDI r3, 240
    LDI r7, 0xaaaaaa
    LDI r15, 0x1a1f29
    DRAWTEXT r2, r0, r3, r7, r15

    ; Scroll hint
    LDI r12, 110
    LDI r13, 240
    LDI r10, STR_BUF
    ADDI r10, 64
    DRAWTEXT r12, r13, r10, r7, r15

    ; ESC hint
    LDI r12, 190
    LDI r13, 240
    LDI r10, STR_BUF
    ADDI r10, 128
    DRAWTEXT r12, r13, r10, r7, r15

; ── HEX INPUT ─────────────────────────────────
hex_input:
    FRAME

    IKEY r2
    CMPI r2, 0
    JZ r14, main_loop

    ; ESC = 27 -- back to list
    CMPI r2, 27
    JNZ r14, not_esc
    LDI r20, MODE
    LDI r13, 0
    STORE r20, r13
    JMP main_loop

not_esc:
    ; W = 87 (up)
    CMPI r2, 87
    JNZ r14, not_hup
    LDI r20, SCROLL_OFF
    LOAD r25, r20
    CMPI r25, 0
    JZ r14, main_loop
    LDI r4, BYTES_PER_ROW
    SUB r25, r4
    STORE r20, r25
    JMP main_loop

not_hup:
    ; S = 83 (down)
    CMPI r2, 83
    JNZ r14, main_loop
    LDI r20, SCROLL_OFF
    LOAD r25, r20
    LDI r4, BYTES_PER_ROW
    ADD r25, r4
    LDI r1, FILE_SIZE
    LOAD r1, r1
    CMP r25, r1
    BGE r14, main_loop
    STORE r20, r25
    JMP main_loop
