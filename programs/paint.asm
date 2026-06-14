; paint.asm -- Enhanced Mouse-Driven Paint App for Geometry OS
; Phase 420: Full-featured pixel painting with brush tools, color picker,
;            brush size adjustment, and canvas save/load via VFS.
;
; Proves: MOUSEQ opcode (0x85), PSET pixel drawing, LINE smooth strokes,
;         HITSET/HITQ buttons, FRAME loop, color palette selection,
;         IKEY keyboard input, OPEN/WRITE/READ/CLOSE VFS operations,
;         brush size adjustment.
;
; Controls:
;   Mouse movement + left-click in canvas area = paint with current brush
;   Bottom palette = click to select color (8 colors + gray)
;   [ (91) = decrease brush size (min 1)
;   ] (93) = increase brush size (max 8)
;   S (83) = save canvas to VFS file "painting.dat"
;   L (76) = load canvas from VFS file "painting.dat"
;   C (67) = clear canvas
;
; RAM Layout (all above code area ~0x600):
;   0x700  current color (u32, starts red 0xFF0000)
;   0x704  previous mouse X
;   0x708  previous mouse Y
;   0x70C  brush size (1-8, starts 1)
;   0x710  status message timer (counts down)
;   0x714  status message type (0=none, 1=saved, 2=loaded, 3=error)
;   0x730  filename buffer "painting.dat"
;   0x750  "SAVED" text
;   0x760  "LOADED" text
;   0x770  "ERROR" text
;   0x780  "PAINT" text
;   0x790  "SZ:" text
;   0x800  save buffer (256 words for 16x16 thumbnail)
;
; NOTE: Avoid colons in comments (assembler pitfall)

#define COLOR    0x700
#define PREV_X   0x704
#define PREV_Y   0x708
#define BRUSH    0x70C
#define MSG_TMR  0x710
#define MSG_TYP  0x714
#define FNAME    0x730
#define STR_SAVE 0x750
#define STR_LOAD 0x760
#define STR_ERR  0x770
#define STR_PNT  0x780
#define STR_SZ   0x790
#define SAVEBUF  0x800

; ── INIT ──────────────────────────────────────
LDI r1, 1

; Default color = red
LDI r20, COLOR
LDI r2, 0xFF0000
STORE r20, r2

; Brush size = 1
LDI r20, BRUSH
STORE r20, r1

; Status = off
LDI r20, MSG_TMR
LDI r2, 0
STORE r20, r2
LDI r20, MSG_TYP
STORE r20, r2

; Previous mouse = 0
LDI r20, PREV_X
STORE r20, r2
LDI r20, PREV_Y
STORE r20, r2

; ── Prepare string buffers ──
LDI r20, FNAME
STRO r20, "painting.dat"
LDI r20, STR_SAVE
STRO r20, "SAVED"
LDI r20, STR_LOAD
STRO r20, "LOADED"
LDI r20, STR_ERR
STRO r20, "ERROR"
LDI r20, STR_PNT
STRO r20, "PAINT"
LDI r20, STR_SZ
STRO r20, "SZ:"

; Fill screen dark
LDI r2, 0x111111
FILL r2

; ── Register hit regions for palette ──
; Palette at y=232, 9 colors, each 26x14
LDI r2, 232
LDI r3, 26
LDI r4, 14

LDI r1, 2
HITSET r1, r2, r3, r4, 1
LDI r1, 30
HITSET r1, r2, r3, r4, 2
LDI r1, 58
HITSET r1, r2, r3, r4, 3
LDI r1, 86
HITSET r1, r2, r3, r4, 4
LDI r1, 114
HITSET r1, r2, r3, r4, 5
LDI r1, 142
HITSET r1, r2, r3, r4, 6
LDI r1, 170
HITSET r1, r2, r3, r4, 7
LDI r1, 198
HITSET r1, r2, r3, r4, 8
LDI r1, 226
HITSET r1, r2, r3, r4, 9

; Clear button
LDI r1, 2
LDI r2, 248
LDI r3, 36
LDI r4, 8
HITSET r1, r2, r3, r4, 99

; ── MAIN LOOP ─────────────────────────────────
main_loop:
    LDI r1, 1

    ; Read mouse
    MOUSEQ r10
    ; r10=mouse_x, r11=mouse_y

    ; Read keyboard
    IKEY r12
    JZ r12, check_palette

    CMPI r12, 91
    JZ r0, brush_down
    CMPI r12, 93
    JZ r0, brush_up
    CMPI r12, 83
    JZ r0, do_save
    CMPI r12, 76
    JZ r0, do_load
    CMPI r12, 67
    JZ r0, do_clear_key
    JMP check_palette

brush_down:
    LDI r20, BRUSH
    LOAD r6, r20
    CMPI r6, 1
    JZ r0, check_palette
    SUBI r6, 1
    STORE r20, r6
    JMP check_palette

brush_up:
    LDI r20, BRUSH
    LOAD r6, r20
    CMPI r6, 8
    JZ r0, check_palette
    ADDI r6, 1
    STORE r20, r6
    JMP check_palette

do_clear_key:
    LDI r2, 0x111111
    FILL r2
    LDI r20, PREV_X
    LDI r2, 0
    STORE r20, r2
    LDI r20, PREV_Y
    STORE r20, r2
    JMP draw_frame

; ── SAVE canvas to VFS ──
do_save:
    LDI r20, FNAME
    LDI r2, 2
    OPEN r20, r2
    MOV r8, r0
    CMPI r8, 100
    BLT r0, save_error

    ; Save first 16x16 pixels of screen as thumbnail
    LDI r7, 0
    save_row:
        CMPI r7, 16
        BGE r0, save_write
        LDI r9, 0
        save_col:
            CMPI r9, 16
            BGE r0, save_next_row
            ; PEEK pixel at (r9, r7)
            MOV r2, r9
            MOV r3, r7
            PEEK r2, r3, r5
            ; Store to SAVEBUF + r7*16 + r9
            LDI r20, SAVEBUF
            MOV r21, r7
            SHLI r21, 4
            ADD r21, r9
            ADD r20, r21
            STORE r20, r5
            ADDI r9, 1
            JMP save_col
        save_next_row:
        ADDI r7, 1
        JMP save_row

    save_write:
    LDI r20, SAVEBUF
    LDI r2, 256
    WRITE r8, r20, r2
    CLOSE r8

    LDI r20, MSG_TMR
    LDI r2, 60
    STORE r20, r2
    LDI r20, MSG_TYP
    LDI r2, 1
    STORE r20, r2
    JMP check_palette

save_error:
    LDI r20, MSG_TMR
    LDI r2, 60
    STORE r20, r2
    LDI r20, MSG_TYP
    LDI r2, 3
    STORE r20, r2
    JMP check_palette

; ── LOAD canvas from VFS ──
do_load:
    LDI r20, FNAME
    LDI r2, 0
    OPEN r20, r2
    MOV r8, r0
    CMPI r8, 100
    BLT r0, load_error

    LDI r20, SAVEBUF
    LDI r2, 256
    READ r8, r20, r2
    CLOSE r8

    ; Paint loaded thumbnail scaled 1:1 at top-left
    LDI r7, 0
    load_row:
        CMPI r7, 16
        BGE r0, load_done
        LDI r9, 0
        load_col:
            CMPI r9, 16
            BGE r0, load_next_row
            LDI r20, SAVEBUF
            MOV r21, r7
            SHLI r21, 4
            ADD r21, r9
            ADD r20, r21
            LOAD r5, r20
            PSET r9, r7, r5
            ADDI r9, 1
            JMP load_col
        load_next_row:
        ADDI r7, 1
        JMP load_row

    load_done:
    LDI r20, MSG_TMR
    LDI r2, 60
    STORE r20, r2
    LDI r20, MSG_TYP
    LDI r2, 2
    STORE r20, r2
    JMP check_palette

load_error:
    LDI r20, MSG_TMR
    LDI r2, 60
    STORE r20, r2
    LDI r20, MSG_TYP
    LDI r2, 3
    STORE r20, r2
    JMP check_palette

; ── Palette hit regions ──
check_palette:
    LDI r1, 1
    HITQ r12
    JZ r12, check_paint

    CMPI r12, 1
    JZ r0, set_red
    CMPI r12, 2
    JZ r0, set_green
    CMPI r12, 3
    JZ r0, set_blue
    CMPI r12, 4
    JZ r0, set_yellow
    CMPI r12, 5
    JZ r0, set_cyan
    CMPI r12, 6
    JZ r0, set_magenta
    CMPI r12, 7
    JZ r0, set_white
    CMPI r12, 8
    JZ r0, set_orange
    CMPI r12, 9
    JZ r0, set_gray
    CMPI r12, 99
    JZ r0, do_clear
    JMP check_paint

set_red:
    LDI r20, COLOR
    LDI r2, 0xFF0000
    STORE r20, r2
    JMP draw_frame

set_green:
    LDI r20, COLOR
    LDI r2, 0x00FF00
    STORE r20, r2
    JMP draw_frame

set_blue:
    LDI r20, COLOR
    LDI r2, 0x0000FF
    STORE r20, r2
    JMP draw_frame

set_yellow:
    LDI r20, COLOR
    LDI r2, 0xFFFF00
    STORE r20, r2
    JMP draw_frame

set_cyan:
    LDI r20, COLOR
    LDI r2, 0x00FFFF
    STORE r20, r2
    JMP draw_frame

set_magenta:
    LDI r20, COLOR
    LDI r2, 0xFF00FF
    STORE r20, r2
    JMP draw_frame

set_white:
    LDI r20, COLOR
    LDI r2, 0xFFFFFF
    STORE r20, r2
    JMP draw_frame

set_orange:
    LDI r20, COLOR
    LDI r2, 0xFF8800
    STORE r20, r2
    JMP draw_frame

set_gray:
    LDI r20, COLOR
    LDI r2, 0x444444
    STORE r20, r2
    JMP draw_frame

do_clear:
    LDI r2, 0x111111
    FILL r2
    LDI r20, PREV_X
    LDI r2, 0
    STORE r20, r2
    LDI r20, PREV_Y
    STORE r20, r2
    JMP draw_frame

; ── Paint with brush ──
check_paint:
    ; Only paint in canvas area
    CMPI r11, 232
    BGE r0, draw_frame

    ; Load color and brush
    LDI r20, COLOR
    LOAD r5, r20
    LDI r20, BRUSH
    LOAD r6, r20

    ; Draw brush-sized block
    LDI r7, 0
    bx_loop:
        CMP r7, r6
        BGE r0, brush_done
        MOV r2, r10
        ADD r2, r7
        LDI r3, 0
        by_loop:
            CMP r3, r6
            BGE r0, bx_next
            MOV r4, r11
            ADD r4, r3
            CMPI r2, 256
            BGE r0, by_next
            CMPI r4, 232
            BGE r0, by_next
            PSET r2, r4, r5
        by_next:
            ADDI r3, 1
            JMP by_loop
    bx_next:
        ADDI r7, 1
        JMP bx_loop

    brush_done:
    ; Draw line from prev pos for smooth strokes
    LDI r20, PREV_X
    LOAD r2, r20
    CMPI r2, 0
    JZ r0, save_pos
    LDI r20, PREV_Y
    LOAD r3, r20
    LINE r2, r3, r10, r11, r5

save_pos:
    LDI r20, PREV_X
    STORE r20, r10
    LDI r20, PREV_Y
    STORE r20, r11
    JMP draw_frame

; ── DRAW FRAME ─────────────────────────────────
draw_frame:
    LDI r1, 1

    ; Palette background
    LDI r1, 0
    LDI r2, 230
    LDI r3, 256
    LDI r4, 26
    LDI r5, 0x222222
    RECTF r1, r2, r3, r4, r5

    ; Color swatches
    LDI r2, 232
    LDI r3, 26
    LDI r4, 14

    LDI r1, 2
    LDI r5, 0xFF0000
    RECTF r1, r2, r3, r4, r5
    LDI r1, 30
    LDI r5, 0x00FF00
    RECTF r1, r2, r3, r4, r5
    LDI r1, 58
    LDI r5, 0x0000FF
    RECTF r1, r2, r3, r4, r5
    LDI r1, 86
    LDI r5, 0xFFFF00
    RECTF r1, r2, r3, r4, r5
    LDI r1, 114
    LDI r5, 0x00FFFF
    RECTF r1, r2, r3, r4, r5
    LDI r1, 142
    LDI r5, 0xFF00FF
    RECTF r1, r2, r3, r4, r5
    LDI r1, 170
    LDI r5, 0xFFFFFF
    RECTF r1, r2, r3, r4, r5
    LDI r1, 198
    LDI r5, 0xFF8800
    RECTF r1, r2, r3, r4, r5
    LDI r1, 226
    LDI r5, 0x444444
    RECTF r1, r2, r3, r4, r5

    ; Highlight selected color
    LDI r20, COLOR
    LOAD r5, r20

    LDI r1, 2
    CMPI r5, 0x00FF00
    JNZ r0, hl_n2
    LDI r1, 30
    JMP hl_draw
    hl_n2:
    CMPI r5, 0x0000FF
    JNZ r0, hl_n3
    LDI r1, 58
    JMP hl_draw
    hl_n3:
    CMPI r5, 0xFFFF00
    JNZ r0, hl_n4
    LDI r1, 86
    JMP hl_draw
    hl_n4:
    CMPI r5, 0x00FFFF
    JNZ r0, hl_n5
    LDI r1, 114
    JMP hl_draw
    hl_n5:
    CMPI r5, 0xFF00FF
    JNZ r0, hl_n6
    LDI r1, 142
    JMP hl_draw
    hl_n6:
    CMPI r5, 0xFFFFFF
    JNZ r0, hl_n7
    LDI r1, 170
    JMP hl_draw
    hl_n7:
    CMPI r5, 0xFF8800
    JNZ r0, hl_n8
    LDI r1, 198
    JMP hl_draw
    hl_n8:
    CMPI r5, 0x444444
    JNZ r0, hl_draw
    LDI r1, 226

    hl_draw:
    SUBI r1, 1
    LDI r2, 231
    LDI r3, 30
    LDI r4, 16
    LDI r6, 0xFFFFFF
    RECT r1, r2, r3, r4, r6

    ; Brush size indicator (top-right)
    LDI r20, BRUSH
    LOAD r6, r20
    LDI r1, 248
    LDI r2, 2
    MOV r3, r6
    MOV r4, r6
    LDI r20, COLOR
    LOAD r5, r20
    RECTF r1, r2, r3, r4, r5

    ; "SZ:" label
    LDI r1, 224
    LDI r2, 2
    LDI r3, STR_SZ
    TEXT r1, r2, r3

    ; Status message
    LDI r20, MSG_TMR
    LOAD r2, r20
    CMPI r2, 0
    JZ r0, draw_title

    SUBI r2, 1
    STORE r20, r2

    LDI r20, MSG_TYP
    LOAD r3, r20
    CMPI r3, 1
    JNZ r0, msg_n1
    LDI r1, 100
    LDI r2, 2
    LDI r3, STR_SAVE
    TEXT r1, r2, r3
    JMP draw_title
    msg_n1:
    CMPI r3, 2
    JNZ r0, msg_n2
    LDI r1, 100
    LDI r2, 2
    LDI r3, STR_LOAD
    TEXT r1, r2, r3
    JMP draw_title
    msg_n2:
    LDI r1, 100
    LDI r2, 2
    LDI r3, STR_ERR
    TEXT r1, r2, r3

draw_title:
    ; Title text
    LDI r1, 2
    LDI r2, 2
    LDI r3, STR_PNT
    TEXT r1, r2, r3

    ; Clear button
    LDI r1, 2
    LDI r2, 248
    LDI r3, 36
    LDI r4, 8
    LDI r5, 0x555555
    RECTF r1, r2, r3, r4, r5

do_frame:
    FRAME
    JMP main_loop
