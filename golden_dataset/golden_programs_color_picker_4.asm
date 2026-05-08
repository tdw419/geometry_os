; DESCRIPTION: This GeOS assembly code implements a mouse-driven color picker interface. It displays a preview box with an outline and fills it with the selected color, features RGB sliders for adjusting color components, and includes a palette of predefined colors for selection. The code uses GeOS opcodes such as `RECT` for drawing outlines, `RECTF` for filling areas, and `FRAME` for creating an animation loop, along with mouse interaction through `MOUSEQ` and `HITQ`.

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
    LDI r15, 0xFF0000
    LDI r21, COLOR_ADDR
    STORE r15, r21
    LDI r15, 255
    LDI r21, RED_ADDR
    STORE r15, r21
    LDI r15, 0
    LDI r21, GREEN_ADDR
    STORE r15, r21
    LDI r21, BLUE_ADDR
    STORE r15, r21

frame_loop:
    ; Clear screen
    LDI r10, 0x1A1A2E
    FILL r10

    ; Title
    LDI r15, STR_ADDR
    STRO r15, "Color Picker"
    LDI r15, 90
    LDI r9, 8
    LDI r4, STR_ADDR
    TEXT r15, r9, r4

    ; Preview box - outline using RECT
    LDI r15, PREVIEW_X
    LDI r9, PREVIEW_Y
    LDI r4, PREVIEW_SZ
    LDI r3, PREVIEW_SZ
    LDI r10, 0xAAAAAA
    RECT r15, r9, r4, r3, r10

    ; Preview fill using RECTF
    LDI r21, COLOR_ADDR
    LOAD r10, r21
    RECTF r15, r9, r4, r3, r10

    ; Re-draw outline on top of fill
    LDI r10, 0xAAAAAA
    RECT r15, r9, r4, r3, r10

    ; --- Red slider ---
    LDI r15, SLIDER_X
    LDI r9, R_SLIDER_Y
    LDI r4, SLIDER_W
    LDI r3, SLIDER_H
    LDI r10, 0xFF0000
    RECT r15, r9, r4, r3, r10

    LDI r15, STR_ADDR
    STRO r15, "R"
    LDI r15, 15
    LDI r9, R_SLIDER_Y
    LDI r4, STR_ADDR
    TEXT r15, r9, r4

    ; Red slider fill
    LDI r21, RED_ADDR
    LOAD r15, r21
    LDI r9, 255
    MUL r15, r9
    LDI r9, SLIDER_W
    DIV r15, r9
    LDI r4, SLIDER_X
    LDI r1, 30
    ADD r4, r1
    LDI r3, R_SLIDER_Y
    LDI r1, 1
    ADD r3, r1
    LDI r10, 0xFF4444
    RECTF r4, r3, r15, r10, r10

    ; --- Green slider ---
    LDI r15, SLIDER_X
    LDI r9, G_SLIDER_Y
    LDI r4, SLIDER_W
    LDI r3, SLIDER_H
    LDI r10, 0x00FF00
    RECT r15, r9, r4, r3, r10

    LDI r15, STR_ADDR
    STRO r15, "G"
    LDI r15, 15
    LDI r9, G_SLIDER_Y
    LDI r4, STR_ADDR
    TEXT r15, r9, r4

    ; Green slider fill
    LDI r21, GREEN_ADDR
    LOAD r15, r21
    LDI r9, 255
    MUL r15, r9
    LDI r9, SLIDER_W
    DIV r15, r9
    LDI r4, SLIDER_X
    ADD r4, r1
    LDI r3, G_SLIDER_Y
    ADD r3, r1
    LDI r10, 0x44FF44
    RECTF r4, r3, r15, r10, r10

    ; --- Blue slider ---
    LDI r15, SLIDER_X
    LDI r9, B_SLIDER_Y
    LDI r4, SLIDER_W
    LDI r3, SLIDER_H
    LDI r10, 0x0000FF
    RECT r15, r9, r4, r3, r10

    LDI r15, STR_ADDR
    STRO r15, "B"
    LDI r15, 15
    LDI r9, B_SLIDER_Y
    LDI r4, STR_ADDR
    TEXT r15, r9, r4

    ; Blue slider fill
    LDI r21, BLUE_ADDR
    LOAD r15, r21
    LDI r9, 255
    MUL r15, r9
    LDI r9, SLIDER_W
    DIV r15, r9
    LDI r4, SLIDER_X
    ADD r4, r1
    LDI r3, B_SLIDER_Y
    ADD r3, r1
    LDI r10, 0x4444FF
    RECTF r4, r3, r15, r10, r10

    ; --- Palette (8 swatches) ---
    LDI r5, 10
    LDI r0, PAL_Y
    LDI r12, 20
    LDI r11, 20
    LDI r20, 0

pal_loop:
    CMPI r20, 0
    JNZ r7, not_p0
    LDI r10, 0xFF0000
    JMP pal_draw
not_p0:
    CMPI r20, 1
    JNZ r7, not_p1
    LDI r10, 0x00FF00
    JMP pal_draw
not_p1:
    CMPI r20, 2
    JNZ r7, not_p2
    LDI r10, 0x0000FF
    JMP pal_draw
not_p2:
    CMPI r20, 3
    JNZ r7, not_p3
    LDI r10, 0xFFFF00
    JMP pal_draw
not_p3:
    CMPI r20, 4
    JNZ r7, not_p4
    LDI r10, 0xFF00FF
    JMP pal_draw
not_p4:
    CMPI r20, 5
    JNZ r7, not_p5
    LDI r10, 0x00FFFF
    JMP pal_draw
not_p5:
    CMPI r20, 6
    JNZ r7, not_p6
    LDI r10, 0xFFFFFF
    JMP pal_draw
not_p6:
    CMPI r20, 7
    JNZ r7, pal_done
    LDI r10, 0xFF8800
    JMP pal_draw

pal_draw:
    RECTF r5, r0, r12, r11, r10
    LDI r2, 0x888888
    RECT r5, r0, r12, r11, r2
    LDI r1, 25
    ADD r5, r1
    LDI r1, 1
    ADD r20, r1
    CMPI r20, 8
    BLT r7, pal_loop

pal_done:
    ; --- Hit regions for palette ---
    LDI r5, 10
    LDI r0, PAL_Y
    LDI r12, 20
    LDI r11, 20
    HITSET r5, r0, r12, r11, 1
    LDI r1, 25
    ADD r5, r1
    HITSET r5, r0, r12, r11, 2
    ADD r5, r1
    HITSET r5, r0, r12, r11, 3
    ADD r5, r1
    HITSET r5, r0, r12, r11, 4
    ADD r5, r1
    HITSET r5, r0, r12, r11, 5
    ADD r5, r1
    HITSET r5, r0, r12, r11, 6
    ADD r5, r1
    HITSET r5, r0, r12, r11, 7
    ADD r5, r1
    HITSET r5, r0, r12, r11, 8

    ; Hit regions for sliders
    LDI r5, SLIDER_X
    LDI r12, SLIDER_W
    LDI r11, SLIDER_H
    LDI r0, R_SLIDER_Y
    HITSET r5, r0, r12, r11, 10
    LDI r0, G_SLIDER_Y
    HITSET r5, r0, r12, r11, 11
    LDI r0, B_SLIDER_Y
    HITSET r5, r0, r12, r11, 12

    ; Query mouse and hits
    MOUSEQ r2
    HITQ r14

    ; Handle palette clicks (IDs 1-8)
    CMPI r14, 1
    JNZ r7, chk_p2
    LDI r15, 0xFF0000
    LDI r21, COLOR_ADDR
    STORE r15, r21
    LDI r15, 255
    LDI r21, RED_ADDR
    STORE r15, r21
    LDI r15, 0
    LDI r21, GREEN_ADDR
    STORE r15, r21
    LDI r21, BLUE_ADDR
    STORE r15, r21
    JMP click_done

chk_p2:
    CMPI r14, 2
    JNZ r7, chk_p3
    LDI r15, 0x00FF00
    LDI r21, COLOR_ADDR
    STORE r15, r21
    LDI r15, 0
    LDI r21, RED_ADDR
    STORE r15, r21
    LDI r15, 255
    LDI r21, GREEN_ADDR
    STORE r15, r21
    LDI r21, BLUE_ADDR
    STORE r15, r21
    JMP click_done

chk_p3:
    CMPI r14, 3
    JNZ r7, chk_p4
    LDI r15, 0x0000FF
    LDI r21, COLOR_ADDR
    STORE r15, r21
    LDI r15, 0
    LDI r21, RED_ADDR
    STORE r15, r21
    LDI r21, GREEN_ADDR
    STORE r15, r21
    LDI r15, 255
    LDI r21, BLUE_ADDR
    STORE r15, r21
    JMP click_done

chk_p4:
    CMPI r14, 4
    JNZ r7, chk_p5
    LDI r15, 0xFFFF00
    LDI r21, COLOR_ADDR
    STORE r15, r21
    LDI r15, 255
    LDI r21, RED_ADDR
    STORE r15, r21
    LDI r21, GREEN_ADDR
    STORE r15, r21
    LDI r15, 0
    LDI r21, BLUE_ADDR
    STORE r15, r21
    JMP click_done

chk_p5:
    CMPI r14, 5
    JNZ r7, chk_p6
    LDI r15, 0xFF00FF
    LDI r21, COLOR_ADDR
    STORE r15, r21
    LDI r15, 255
    LDI r21, RED_ADDR
    STORE r15, r21
    LDI r15, 0
    LDI r21, GREEN_ADDR
    STORE r15, r21
    LDI r15, 255
    LDI r21, BLUE_ADDR
    STORE r15, r21
    JMP click_done

chk_p6:
    CMPI r14, 6
    JNZ r7, chk_p7
    LDI r15, 0x00FFFF
    LDI r21, COLOR_ADDR
    STORE r15, r21
    LDI r15, 0
    LDI r21, RED_ADDR
    STORE r15, r21
    LDI r15, 255
    LDI r21, GREEN_ADDR
    STORE r15, r21
    LDI r15, 255
    LDI r21, BLUE_ADDR
    STORE r15, r21
    JMP click_done

chk_p7:
    CMPI r14, 7
    JNZ r7, chk_p8
    LDI r15, 0xFFFFFF
    LDI r21, COLOR_ADDR
    STORE r15, r21
    LDI r15, 255
    LDI r21, RED_ADDR
    STORE r15, r21
    LDI r21, GREEN_ADDR
    STORE r15, r21
    LDI r21, BLUE_ADDR
    STORE r15, r21
    JMP click_done

chk_p8:
    CMPI r14, 8
    JNZ r7, click_done
    LDI r15, 0xFF8800
    LDI r21, COLOR_ADDR
    STORE r15, r21
    LDI r15, 255
    LDI r21, RED_ADDR
    STORE r15, r21
    LDI r15, 136
    LDI r21, GREEN_ADDR
    STORE r15, r21
    LDI r15, 0
    LDI r21, BLUE_ADDR
    STORE r15, r21

click_done:
    FRAME
    JMP frame_loop
