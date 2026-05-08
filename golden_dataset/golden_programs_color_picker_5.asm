; DESCRIPTION: Draws a red rectangle at the screen with fixed size.

; color_picker.asm -- Mouse-Driven Color Picker for Geometry OS
;
; Proves: RECT (0x88) outline opcode, HITSET/HITQ mouse interaction,
;         RECTF fills, FRAME animation loop, TEXT rendering.
;
; Controls:
;   Click palette colors at bottom to select
;   Preview square shows selected color with outline border
;   RGB sliders show component levels
;
; RAM Layout (placed after bytecode using .org):
;   0x800  selected_color (u32)
;   0x804  red component (0-255)
;   0x808  green component (0-255)
;   0x80C  blue component (0-255)
;   0x900  string buffer for text

#define PREVIEW_X 80
#define PREVIEW_Y 30
#define PREVIEW_SZ 96
#define SLIDER_X 30
#define SLIDER_W 196
#define SLIDER_H 12
#define R_SLIDER_Y 150
#define G_SLIDER_Y 170
#define B_SLIDER_Y 190
#define PAL_Y 220
#define COLOR_ADDR 0x800
#define RED_ADDR 0x804
#define GREEN_ADDR 0x808
#define BLUE_ADDR 0x80C
#define STR_ADDR 0x900

start:
    ; Initialize color to red
    LDI r11, 0xFF0000
    LDI r21, COLOR_ADDR
    STORE r11, r21
    LDI r11, 255
    LDI r21, RED_ADDR
    STORE r11, r21
    LDI r11, 0
    LDI r21, GREEN_ADDR
    STORE r11, r21
    LDI r21, BLUE_ADDR
    STORE r11, r21

frame_loop:
    ; Clear screen
    LDI r13, 0x1A1A2E
    FILL r13

    ; Title
    LDI r11, STR_ADDR
    STRO r11, "Color Picker"
    LDI r11, 90
    LDI r6, 8
    LDI r4, STR_ADDR
    TEXT r11, r6, r4

    ; Preview box - outline using RECT
    LDI r11, PREVIEW_X
    LDI r6, PREVIEW_Y
    LDI r4, PREVIEW_SZ
    LDI r2, PREVIEW_SZ
    LDI r13, 0xAAAAAA
    RECT r11, r6, r4, r2, r13

    ; Preview fill using RECTF
    LDI r21, COLOR_ADDR
    LOAD r13, r21
    RECTF r11, r6, r4, r2, r13

    ; Re-draw outline on top of fill
    LDI r13, 0xAAAAAA
    RECT r11, r6, r4, r2, r13

    ; --- Red slider ---
    LDI r11, SLIDER_X
    LDI r6, R_SLIDER_Y
    LDI r4, SLIDER_W
    LDI r2, SLIDER_H
    LDI r13, 0xFF0000
    RECT r11, r6, r4, r2, r13

    LDI r11, STR_ADDR
    STRO r11, "R"
    LDI r11, 15
    LDI r6, R_SLIDER_Y
    LDI r4, STR_ADDR
    TEXT r11, r6, r4

    ; Red slider fill
    LDI r21, RED_ADDR
    LOAD r11, r21
    LDI r6, 255
    MUL r11, r6
    LDI r6, SLIDER_W
    DIV r11, r6
    LDI r4, SLIDER_X
    LDI r14, 30
    ADD r4, r14
    LDI r2, R_SLIDER_Y
    LDI r14, 1
    ADD r2, r14
    LDI r13, 0xFF4444
    RECTF r4, r2, r11, r13, r13

    ; --- Green slider ---
    LDI r11, SLIDER_X
    LDI r6, G_SLIDER_Y
    LDI r4, SLIDER_W
    LDI r2, SLIDER_H
    LDI r13, 0x00FF00
    RECT r11, r6, r4, r2, r13

    LDI r11, STR_ADDR
    STRO r11, "G"
    LDI r11, 15
    LDI r6, G_SLIDER_Y
    LDI r4, STR_ADDR
    TEXT r11, r6, r4

    ; Green slider fill
    LDI r21, GREEN_ADDR
    LOAD r11, r21
    LDI r6, 255
    MUL r11, r6
    LDI r6, SLIDER_W
    DIV r11, r6
    LDI r4, SLIDER_X
    ADD r4, r14
    LDI r2, G_SLIDER_Y
    ADD r2, r14
    LDI r13, 0x44FF44
    RECTF r4, r2, r11, r13, r13

    ; --- Blue slider ---
    LDI r11, SLIDER_X
    LDI r6, B_SLIDER_Y
    LDI r4, SLIDER_W
    LDI r2, SLIDER_H
    LDI r13, 0x0000FF
    RECT r11, r6, r4, r2, r13

    LDI r11, STR_ADDR
    STRO r11, "B"
    LDI r11, 15
    LDI r6, B_SLIDER_Y
    LDI r4, STR_ADDR
    TEXT r11, r6, r4

    ; Blue slider fill
    LDI r21, BLUE_ADDR
    LOAD r11, r21
    LDI r6, 255
    MUL r11, r6
    LDI r6, SLIDER_W
    DIV r11, r6
    LDI r4, SLIDER_X
    ADD r4, r14
    LDI r2, B_SLIDER_Y
    ADD r2, r14
    LDI r13, 0x4444FF
    RECTF r4, r2, r11, r13, r13

    ; --- Palette (8 swatches) ---
    LDI r5, 10
    LDI r9, PAL_Y
    LDI r8, 20
    LDI r7, 20
    LDI r20, 0

pal_loop:
    CMPI r20, 0
    JNZ r3, not_p0
    LDI r13, 0xFF0000
    JMP pal_draw
not_p0:
    CMPI r20, 1
    JNZ r3, not_p1
    LDI r13, 0x00FF00
    JMP pal_draw
not_p1:
    CMPI r20, 2
    JNZ r3, not_p2
    LDI r13, 0x0000FF
    JMP pal_draw
not_p2:
    CMPI r20, 3
    JNZ r3, not_p3
    LDI r13, 0xFFFF00
    JMP pal_draw
not_p3:
    CMPI r20, 4
    JNZ r3, not_p4
    LDI r13, 0xFF00FF
    JMP pal_draw
not_p4:
    CMPI r20, 5
    JNZ r3, not_p5
    LDI r13, 0x00FFFF
    JMP pal_draw
not_p5:
    CMPI r20, 6
    JNZ r3, not_p6
    LDI r13, 0xFFFFFF
    JMP pal_draw
not_p6:
    CMPI r20, 7
    JNZ r3, pal_done
    LDI r13, 0xFF8800
    JMP pal_draw

pal_draw:
    RECTF r5, r9, r8, r7, r13
    LDI r1, 0x888888
    RECT r5, r9, r8, r7, r1
    LDI r14, 25
    ADD r5, r14
    LDI r14, 1
    ADD r20, r14
    CMPI r20, 8
    BLT r3, pal_loop

pal_done:
    ; --- Hit regions for palette ---
    LDI r5, 10
    LDI r9, PAL_Y
    LDI r8, 20
    LDI r7, 20
    HITSET r5, r9, r8, r7, 1
    LDI r14, 25
    ADD r5, r14
    HITSET r5, r9, r8, r7, 2
    ADD r5, r14
    HITSET r5, r9, r8, r7, 3
    ADD r5, r14
    HITSET r5, r9, r8, r7, 4
    ADD r5, r14
    HITSET r5, r9, r8, r7, 5
    ADD r5, r14
    HITSET r5, r9, r8, r7, 6
    ADD r5, r14
    HITSET r5, r9, r8, r7, 7
    ADD r5, r14
    HITSET r5, r9, r8, r7, 8

    ; Hit regions for sliders
    LDI r5, SLIDER_X
    LDI r8, SLIDER_W
    LDI r7, SLIDER_H
    LDI r9, R_SLIDER_Y
    HITSET r5, r9, r8, r7, 10
    LDI r9, G_SLIDER_Y
    HITSET r5, r9, r8, r7, 11
    LDI r9, B_SLIDER_Y
    HITSET r5, r9, r8, r7, 12

    ; Query mouse and hits
    MOUSEQ r1
    HITQ r10

    ; Handle palette clicks (IDs 1-8)
    CMPI r10, 1
    JNZ r3, chk_p2
    LDI r11, 0xFF0000
    LDI r21, COLOR_ADDR
    STORE r11, r21
    LDI r11, 255
    LDI r21, RED_ADDR
    STORE r11, r21
    LDI r11, 0
    LDI r21, GREEN_ADDR
    STORE r11, r21
    LDI r21, BLUE_ADDR
    STORE r11, r21
    JMP click_done

chk_p2:
    CMPI r10, 2
    JNZ r3, chk_p3
    LDI r11, 0x00FF00
    LDI r21, COLOR_ADDR
    STORE r11, r21
    LDI r11, 0
    LDI r21, RED_ADDR
    STORE r11, r21
    LDI r11, 255
    LDI r21, GREEN_ADDR
    STORE r11, r21
    LDI r21, BLUE_ADDR
    STORE r11, r21
    JMP click_done

chk_p3:
    CMPI r10, 3
    JNZ r3, chk_p4
    LDI r11, 0x0000FF
    LDI r21, COLOR_ADDR
    STORE r11, r21
    LDI r11, 0
    LDI r21, RED_ADDR
    STORE r11, r21
    LDI r21, GREEN_ADDR
    STORE r11, r21
    LDI r11, 255
    LDI r21, BLUE_ADDR
    STORE r11, r21
    JMP click_done

chk_p4:
    CMPI r10, 4
    JNZ r3, chk_p5
    LDI r11, 0xFFFF00
    LDI r21, COLOR_ADDR
    STORE r11, r21
    LDI r11, 255
    LDI r21, RED_ADDR
    STORE r11, r21
    LDI r21, GREEN_ADDR
    STORE r11, r21
    LDI r11, 0
    LDI r21, BLUE_ADDR
    STORE r11, r21
    JMP click_done

chk_p5:
    CMPI r10, 5
    JNZ r3, chk_p6
    LDI r11, 0xFF00FF
    LDI r21, COLOR_ADDR
    STORE r11, r21
    LDI r11, 255
    LDI r21, RED_ADDR
    STORE r11, r21
    LDI r11, 0
    LDI r21, GREEN_ADDR
    STORE r11, r21
    LDI r11, 255
    LDI r21, BLUE_ADDR
    STORE r11, r21
    JMP click_done

chk_p6:
    CMPI r10, 6
    JNZ r3, chk_p7
    LDI r11, 0x00FFFF
    LDI r21, COLOR_ADDR
    STORE r11, r21
    LDI r11, 0
    LDI r21, RED_ADDR
    STORE r11, r21
    LDI r11, 255
    LDI r21, GREEN_ADDR
    STORE r11, r21
    LDI r11, 255
    LDI r21, BLUE_ADDR
    STORE r11, r21
    JMP click_done

chk_p7:
    CMPI r10, 7
    JNZ r3, chk_p8
    LDI r11, 0xFFFFFF
    LDI r21, COLOR_ADDR
    STORE r11, r21
    LDI r11, 255
    LDI r21, RED_ADDR
    STORE r11, r21
    LDI r21, GREEN_ADDR
    STORE r11, r21
    LDI r21, BLUE_ADDR
    STORE r11, r21
    JMP click_done

chk_p8:
    CMPI r10, 8
    JNZ r3, click_done
    LDI r11, 0xFF8800
    LDI r21, COLOR_ADDR
    STORE r11, r21
    LDI r11, 255
    LDI r21, RED_ADDR
    STORE r11, r21
    LDI r11, 136
    LDI r21, GREEN_ADDR
    STORE r11, r21
    LDI r11, 0
    LDI r21, BLUE_ADDR
    STORE r11, r21

click_done:
    FRAME
    JMP frame_loop
