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
    LDI r8, 0xFF0000
    LDI r21, COLOR_ADDR
    STORE r8, r21
    LDI r8, 255
    LDI r21, RED_ADDR
    STORE r8, r21
    LDI r8, 0
    LDI r21, GREEN_ADDR
    STORE r8, r21
    LDI r21, BLUE_ADDR
    STORE r8, r21

frame_loop:
    ; Clear screen
    LDI r5, 0x1A1A2E
    FILL r5

    ; Title
    LDI r8, STR_ADDR
    STRO r8, "Color Picker"
    LDI r8, 90
    LDI r0, 8
    LDI r11, STR_ADDR
    TEXT r8, r0, r11

    ; Preview box - outline using RECT
    LDI r8, PREVIEW_X
    LDI r0, PREVIEW_Y
    LDI r11, PREVIEW_SZ
    LDI r2, PREVIEW_SZ
    LDI r5, 0xAAAAAA
    RECT r8, r0, r11, r2, r5

    ; Preview fill using RECTF
    LDI r21, COLOR_ADDR
    LOAD r5, r21
    RECTF r8, r0, r11, r2, r5

    ; Re-draw outline on top of fill
    LDI r5, 0xAAAAAA
    RECT r8, r0, r11, r2, r5

    ; --- Red slider ---
    LDI r8, SLIDER_X
    LDI r0, R_SLIDER_Y
    LDI r11, SLIDER_W
    LDI r2, SLIDER_H
    LDI r5, 0xFF0000
    RECT r8, r0, r11, r2, r5

    LDI r8, STR_ADDR
    STRO r8, "R"
    LDI r8, 15
    LDI r0, R_SLIDER_Y
    LDI r11, STR_ADDR
    TEXT r8, r0, r11

    ; Red slider fill
    LDI r21, RED_ADDR
    LOAD r8, r21
    LDI r0, 255
    MUL r8, r0
    LDI r0, SLIDER_W
    DIV r8, r0
    LDI r11, SLIDER_X
    LDI r1, 30
    ADD r11, r1
    LDI r2, R_SLIDER_Y
    LDI r1, 1
    ADD r2, r1
    LDI r5, 0xFF4444
    RECTF r11, r2, r8, r5, r5

    ; --- Green slider ---
    LDI r8, SLIDER_X
    LDI r0, G_SLIDER_Y
    LDI r11, SLIDER_W
    LDI r2, SLIDER_H
    LDI r5, 0x00FF00
    RECT r8, r0, r11, r2, r5

    LDI r8, STR_ADDR
    STRO r8, "G"
    LDI r8, 15
    LDI r0, G_SLIDER_Y
    LDI r11, STR_ADDR
    TEXT r8, r0, r11

    ; Green slider fill
    LDI r21, GREEN_ADDR
    LOAD r8, r21
    LDI r0, 255
    MUL r8, r0
    LDI r0, SLIDER_W
    DIV r8, r0
    LDI r11, SLIDER_X
    ADD r11, r1
    LDI r2, G_SLIDER_Y
    ADD r2, r1
    LDI r5, 0x44FF44
    RECTF r11, r2, r8, r5, r5

    ; --- Blue slider ---
    LDI r8, SLIDER_X
    LDI r0, B_SLIDER_Y
    LDI r11, SLIDER_W
    LDI r2, SLIDER_H
    LDI r5, 0x0000FF
    RECT r8, r0, r11, r2, r5

    LDI r8, STR_ADDR
    STRO r8, "B"
    LDI r8, 15
    LDI r0, B_SLIDER_Y
    LDI r11, STR_ADDR
    TEXT r8, r0, r11

    ; Blue slider fill
    LDI r21, BLUE_ADDR
    LOAD r8, r21
    LDI r0, 255
    MUL r8, r0
    LDI r0, SLIDER_W
    DIV r8, r0
    LDI r11, SLIDER_X
    ADD r11, r1
    LDI r2, B_SLIDER_Y
    ADD r2, r1
    LDI r5, 0x4444FF
    RECTF r11, r2, r8, r5, r5

    ; --- Palette (8 swatches) ---
    LDI r14, 10
    LDI r12, PAL_Y
    LDI r7, 20
    LDI r10, 20
    LDI r20, 0

pal_loop:
    CMPI r20, 0
    JNZ r15, not_p0
    LDI r5, 0xFF0000
    JMP pal_draw
not_p0:
    CMPI r20, 1
    JNZ r15, not_p1
    LDI r5, 0x00FF00
    JMP pal_draw
not_p1:
    CMPI r20, 2
    JNZ r15, not_p2
    LDI r5, 0x0000FF
    JMP pal_draw
not_p2:
    CMPI r20, 3
    JNZ r15, not_p3
    LDI r5, 0xFFFF00
    JMP pal_draw
not_p3:
    CMPI r20, 4
    JNZ r15, not_p4
    LDI r5, 0xFF00FF
    JMP pal_draw
not_p4:
    CMPI r20, 5
    JNZ r15, not_p5
    LDI r5, 0x00FFFF
    JMP pal_draw
not_p5:
    CMPI r20, 6
    JNZ r15, not_p6
    LDI r5, 0xFFFFFF
    JMP pal_draw
not_p6:
    CMPI r20, 7
    JNZ r15, pal_done
    LDI r5, 0xFF8800
    JMP pal_draw

pal_draw:
    RECTF r14, r12, r7, r10, r5
    LDI r3, 0x888888
    RECT r14, r12, r7, r10, r3
    LDI r1, 25
    ADD r14, r1
    LDI r1, 1
    ADD r20, r1
    CMPI r20, 8
    BLT r15, pal_loop

pal_done:
    ; --- Hit regions for palette ---
    LDI r14, 10
    LDI r12, PAL_Y
    LDI r7, 20
    LDI r10, 20
    HITSET r14, r12, r7, r10, 1
    LDI r1, 25
    ADD r14, r1
    HITSET r14, r12, r7, r10, 2
    ADD r14, r1
    HITSET r14, r12, r7, r10, 3
    ADD r14, r1
    HITSET r14, r12, r7, r10, 4
    ADD r14, r1
    HITSET r14, r12, r7, r10, 5
    ADD r14, r1
    HITSET r14, r12, r7, r10, 6
    ADD r14, r1
    HITSET r14, r12, r7, r10, 7
    ADD r14, r1
    HITSET r14, r12, r7, r10, 8

    ; Hit regions for sliders
    LDI r14, SLIDER_X
    LDI r7, SLIDER_W
    LDI r10, SLIDER_H
    LDI r12, R_SLIDER_Y
    HITSET r14, r12, r7, r10, 10
    LDI r12, G_SLIDER_Y
    HITSET r14, r12, r7, r10, 11
    LDI r12, B_SLIDER_Y
    HITSET r14, r12, r7, r10, 12

    ; Query mouse and hits
    MOUSEQ r3
    HITQ r4

    ; Handle palette clicks (IDs 1-8)
    CMPI r4, 1
    JNZ r15, chk_p2
    LDI r8, 0xFF0000
    LDI r21, COLOR_ADDR
    STORE r8, r21
    LDI r8, 255
    LDI r21, RED_ADDR
    STORE r8, r21
    LDI r8, 0
    LDI r21, GREEN_ADDR
    STORE r8, r21
    LDI r21, BLUE_ADDR
    STORE r8, r21
    JMP click_done

chk_p2:
    CMPI r4, 2
    JNZ r15, chk_p3
    LDI r8, 0x00FF00
    LDI r21, COLOR_ADDR
    STORE r8, r21
    LDI r8, 0
    LDI r21, RED_ADDR
    STORE r8, r21
    LDI r8, 255
    LDI r21, GREEN_ADDR
    STORE r8, r21
    LDI r21, BLUE_ADDR
    STORE r8, r21
    JMP click_done

chk_p3:
    CMPI r4, 3
    JNZ r15, chk_p4
    LDI r8, 0x0000FF
    LDI r21, COLOR_ADDR
    STORE r8, r21
    LDI r8, 0
    LDI r21, RED_ADDR
    STORE r8, r21
    LDI r21, GREEN_ADDR
    STORE r8, r21
    LDI r8, 255
    LDI r21, BLUE_ADDR
    STORE r8, r21
    JMP click_done

chk_p4:
    CMPI r4, 4
    JNZ r15, chk_p5
    LDI r8, 0xFFFF00
    LDI r21, COLOR_ADDR
    STORE r8, r21
    LDI r8, 255
    LDI r21, RED_ADDR
    STORE r8, r21
    LDI r21, GREEN_ADDR
    STORE r8, r21
    LDI r8, 0
    LDI r21, BLUE_ADDR
    STORE r8, r21
    JMP click_done

chk_p5:
    CMPI r4, 5
    JNZ r15, chk_p6
    LDI r8, 0xFF00FF
    LDI r21, COLOR_ADDR
    STORE r8, r21
    LDI r8, 255
    LDI r21, RED_ADDR
    STORE r8, r21
    LDI r8, 0
    LDI r21, GREEN_ADDR
    STORE r8, r21
    LDI r8, 255
    LDI r21, BLUE_ADDR
    STORE r8, r21
    JMP click_done

chk_p6:
    CMPI r4, 6
    JNZ r15, chk_p7
    LDI r8, 0x00FFFF
    LDI r21, COLOR_ADDR
    STORE r8, r21
    LDI r8, 0
    LDI r21, RED_ADDR
    STORE r8, r21
    LDI r8, 255
    LDI r21, GREEN_ADDR
    STORE r8, r21
    LDI r8, 255
    LDI r21, BLUE_ADDR
    STORE r8, r21
    JMP click_done

chk_p7:
    CMPI r4, 7
    JNZ r15, chk_p8
    LDI r8, 0xFFFFFF
    LDI r21, COLOR_ADDR
    STORE r8, r21
    LDI r8, 255
    LDI r21, RED_ADDR
    STORE r8, r21
    LDI r21, GREEN_ADDR
    STORE r8, r21
    LDI r21, BLUE_ADDR
    STORE r8, r21
    JMP click_done

chk_p8:
    CMPI r4, 8
    JNZ r15, click_done
    LDI r8, 0xFF8800
    LDI r21, COLOR_ADDR
    STORE r8, r21
    LDI r8, 255
    LDI r21, RED_ADDR
    STORE r8, r21
    LDI r8, 136
    LDI r21, GREEN_ADDR
    STORE r8, r21
    LDI r8, 0
    LDI r21, BLUE_ADDR
    STORE r8, r21

click_done:
    FRAME
    JMP frame_loop
