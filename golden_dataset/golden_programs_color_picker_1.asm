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
    LDI r14, 0xFF0000
    LDI r21, COLOR_ADDR
    STORE r14, r21
    LDI r14, 255
    LDI r21, RED_ADDR
    STORE r14, r21
    LDI r14, 0
    LDI r21, GREEN_ADDR
    STORE r14, r21
    LDI r21, BLUE_ADDR
    STORE r14, r21

frame_loop:
    ; Clear screen
    LDI r10, 0x1A1A2E
    FILL r10

    ; Title
    LDI r14, STR_ADDR
    STRO r14, "Color Picker"
    LDI r14, 90
    LDI r5, 8
    LDI r1, STR_ADDR
    TEXT r14, r5, r1

    ; Preview box - outline using RECT
    LDI r14, PREVIEW_X
    LDI r5, PREVIEW_Y
    LDI r1, PREVIEW_SZ
    LDI r3, PREVIEW_SZ
    LDI r10, 0xAAAAAA
    RECT r14, r5, r1, r3, r10

    ; Preview fill using RECTF
    LDI r21, COLOR_ADDR
    LOAD r10, r21
    RECTF r14, r5, r1, r3, r10

    ; Re-draw outline on top of fill
    LDI r10, 0xAAAAAA
    RECT r14, r5, r1, r3, r10

    ; --- Red slider ---
    LDI r14, SLIDER_X
    LDI r5, R_SLIDER_Y
    LDI r1, SLIDER_W
    LDI r3, SLIDER_H
    LDI r10, 0xFF0000
    RECT r14, r5, r1, r3, r10

    LDI r14, STR_ADDR
    STRO r14, "R"
    LDI r14, 15
    LDI r5, R_SLIDER_Y
    LDI r1, STR_ADDR
    TEXT r14, r5, r1

    ; Red slider fill
    LDI r21, RED_ADDR
    LOAD r14, r21
    LDI r5, 255
    MUL r14, r5
    LDI r5, SLIDER_W
    DIV r14, r5
    LDI r1, SLIDER_X
    LDI r4, 30
    ADD r1, r4
    LDI r3, R_SLIDER_Y
    LDI r4, 1
    ADD r3, r4
    LDI r10, 0xFF4444
    RECTF r1, r3, r14, r10, r10

    ; --- Green slider ---
    LDI r14, SLIDER_X
    LDI r5, G_SLIDER_Y
    LDI r1, SLIDER_W
    LDI r3, SLIDER_H
    LDI r10, 0x00FF00
    RECT r14, r5, r1, r3, r10

    LDI r14, STR_ADDR
    STRO r14, "G"
    LDI r14, 15
    LDI r5, G_SLIDER_Y
    LDI r1, STR_ADDR
    TEXT r14, r5, r1

    ; Green slider fill
    LDI r21, GREEN_ADDR
    LOAD r14, r21
    LDI r5, 255
    MUL r14, r5
    LDI r5, SLIDER_W
    DIV r14, r5
    LDI r1, SLIDER_X
    ADD r1, r4
    LDI r3, G_SLIDER_Y
    ADD r3, r4
    LDI r10, 0x44FF44
    RECTF r1, r3, r14, r10, r10

    ; --- Blue slider ---
    LDI r14, SLIDER_X
    LDI r5, B_SLIDER_Y
    LDI r1, SLIDER_W
    LDI r3, SLIDER_H
    LDI r10, 0x0000FF
    RECT r14, r5, r1, r3, r10

    LDI r14, STR_ADDR
    STRO r14, "B"
    LDI r14, 15
    LDI r5, B_SLIDER_Y
    LDI r1, STR_ADDR
    TEXT r14, r5, r1

    ; Blue slider fill
    LDI r21, BLUE_ADDR
    LOAD r14, r21
    LDI r5, 255
    MUL r14, r5
    LDI r5, SLIDER_W
    DIV r14, r5
    LDI r1, SLIDER_X
    ADD r1, r4
    LDI r3, B_SLIDER_Y
    ADD r3, r4
    LDI r10, 0x4444FF
    RECTF r1, r3, r14, r10, r10

    ; --- Palette (8 swatches) ---
    LDI r7, 10
    LDI r6, PAL_Y
    LDI r13, 20
    LDI r2, 20
    LDI r20, 0

pal_loop:
    CMPI r20, 0
    JNZ r0, not_p0
    LDI r10, 0xFF0000
    JMP pal_draw
not_p0:
    CMPI r20, 1
    JNZ r0, not_p1
    LDI r10, 0x00FF00
    JMP pal_draw
not_p1:
    CMPI r20, 2
    JNZ r0, not_p2
    LDI r10, 0x0000FF
    JMP pal_draw
not_p2:
    CMPI r20, 3
    JNZ r0, not_p3
    LDI r10, 0xFFFF00
    JMP pal_draw
not_p3:
    CMPI r20, 4
    JNZ r0, not_p4
    LDI r10, 0xFF00FF
    JMP pal_draw
not_p4:
    CMPI r20, 5
    JNZ r0, not_p5
    LDI r10, 0x00FFFF
    JMP pal_draw
not_p5:
    CMPI r20, 6
    JNZ r0, not_p6
    LDI r10, 0xFFFFFF
    JMP pal_draw
not_p6:
    CMPI r20, 7
    JNZ r0, pal_done
    LDI r10, 0xFF8800
    JMP pal_draw

pal_draw:
    RECTF r7, r6, r13, r2, r10
    LDI r9, 0x888888
    RECT r7, r6, r13, r2, r9
    LDI r4, 25
    ADD r7, r4
    LDI r4, 1
    ADD r20, r4
    CMPI r20, 8
    BLT r0, pal_loop

pal_done:
    ; --- Hit regions for palette ---
    LDI r7, 10
    LDI r6, PAL_Y
    LDI r13, 20
    LDI r2, 20
    HITSET r7, r6, r13, r2, 1
    LDI r4, 25
    ADD r7, r4
    HITSET r7, r6, r13, r2, 2
    ADD r7, r4
    HITSET r7, r6, r13, r2, 3
    ADD r7, r4
    HITSET r7, r6, r13, r2, 4
    ADD r7, r4
    HITSET r7, r6, r13, r2, 5
    ADD r7, r4
    HITSET r7, r6, r13, r2, 6
    ADD r7, r4
    HITSET r7, r6, r13, r2, 7
    ADD r7, r4
    HITSET r7, r6, r13, r2, 8

    ; Hit regions for sliders
    LDI r7, SLIDER_X
    LDI r13, SLIDER_W
    LDI r2, SLIDER_H
    LDI r6, R_SLIDER_Y
    HITSET r7, r6, r13, r2, 10
    LDI r6, G_SLIDER_Y
    HITSET r7, r6, r13, r2, 11
    LDI r6, B_SLIDER_Y
    HITSET r7, r6, r13, r2, 12

    ; Query mouse and hits
    MOUSEQ r9
    HITQ r11

    ; Handle palette clicks (IDs 1-8)
    CMPI r11, 1
    JNZ r0, chk_p2
    LDI r14, 0xFF0000
    LDI r21, COLOR_ADDR
    STORE r14, r21
    LDI r14, 255
    LDI r21, RED_ADDR
    STORE r14, r21
    LDI r14, 0
    LDI r21, GREEN_ADDR
    STORE r14, r21
    LDI r21, BLUE_ADDR
    STORE r14, r21
    JMP click_done

chk_p2:
    CMPI r11, 2
    JNZ r0, chk_p3
    LDI r14, 0x00FF00
    LDI r21, COLOR_ADDR
    STORE r14, r21
    LDI r14, 0
    LDI r21, RED_ADDR
    STORE r14, r21
    LDI r14, 255
    LDI r21, GREEN_ADDR
    STORE r14, r21
    LDI r21, BLUE_ADDR
    STORE r14, r21
    JMP click_done

chk_p3:
    CMPI r11, 3
    JNZ r0, chk_p4
    LDI r14, 0x0000FF
    LDI r21, COLOR_ADDR
    STORE r14, r21
    LDI r14, 0
    LDI r21, RED_ADDR
    STORE r14, r21
    LDI r21, GREEN_ADDR
    STORE r14, r21
    LDI r14, 255
    LDI r21, BLUE_ADDR
    STORE r14, r21
    JMP click_done

chk_p4:
    CMPI r11, 4
    JNZ r0, chk_p5
    LDI r14, 0xFFFF00
    LDI r21, COLOR_ADDR
    STORE r14, r21
    LDI r14, 255
    LDI r21, RED_ADDR
    STORE r14, r21
    LDI r21, GREEN_ADDR
    STORE r14, r21
    LDI r14, 0
    LDI r21, BLUE_ADDR
    STORE r14, r21
    JMP click_done

chk_p5:
    CMPI r11, 5
    JNZ r0, chk_p6
    LDI r14, 0xFF00FF
    LDI r21, COLOR_ADDR
    STORE r14, r21
    LDI r14, 255
    LDI r21, RED_ADDR
    STORE r14, r21
    LDI r14, 0
    LDI r21, GREEN_ADDR
    STORE r14, r21
    LDI r14, 255
    LDI r21, BLUE_ADDR
    STORE r14, r21
    JMP click_done

chk_p6:
    CMPI r11, 6
    JNZ r0, chk_p7
    LDI r14, 0x00FFFF
    LDI r21, COLOR_ADDR
    STORE r14, r21
    LDI r14, 0
    LDI r21, RED_ADDR
    STORE r14, r21
    LDI r14, 255
    LDI r21, GREEN_ADDR
    STORE r14, r21
    LDI r14, 255
    LDI r21, BLUE_ADDR
    STORE r14, r21
    JMP click_done

chk_p7:
    CMPI r11, 7
    JNZ r0, chk_p8
    LDI r14, 0xFFFFFF
    LDI r21, COLOR_ADDR
    STORE r14, r21
    LDI r14, 255
    LDI r21, RED_ADDR
    STORE r14, r21
    LDI r21, GREEN_ADDR
    STORE r14, r21
    LDI r21, BLUE_ADDR
    STORE r14, r21
    JMP click_done

chk_p8:
    CMPI r11, 8
    JNZ r0, click_done
    LDI r14, 0xFF8800
    LDI r21, COLOR_ADDR
    STORE r14, r21
    LDI r14, 255
    LDI r21, RED_ADDR
    STORE r14, r21
    LDI r14, 136
    LDI r21, GREEN_ADDR
    STORE r14, r21
    LDI r14, 0
    LDI r21, BLUE_ADDR
    STORE r14, r21

click_done:
    FRAME
    JMP frame_loop
