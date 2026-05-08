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
    LDI r1, 0xFF0000
    LDI r21, COLOR_ADDR
    STORE r1, r21
    LDI r1, 255
    LDI r21, RED_ADDR
    STORE r1, r21
    LDI r1, 0
    LDI r21, GREEN_ADDR
    STORE r1, r21
    LDI r21, BLUE_ADDR
    STORE r1, r21

frame_loop:
    ; Clear screen
    LDI r0, 0x1A1A2E
    FILL r0

    ; Title
    LDI r1, STR_ADDR
    STRO r1, "Color Picker"
    LDI r1, 90
    LDI r15, 8
    LDI r11, STR_ADDR
    TEXT r1, r15, r11

    ; Preview box - outline using RECT
    LDI r1, PREVIEW_X
    LDI r15, PREVIEW_Y
    LDI r11, PREVIEW_SZ
    LDI r8, PREVIEW_SZ
    LDI r0, 0xAAAAAA
    RECT r1, r15, r11, r8, r0

    ; Preview fill using RECTF
    LDI r21, COLOR_ADDR
    LOAD r0, r21
    RECTF r1, r15, r11, r8, r0

    ; Re-draw outline on top of fill
    LDI r0, 0xAAAAAA
    RECT r1, r15, r11, r8, r0

    ; --- Red slider ---
    LDI r1, SLIDER_X
    LDI r15, R_SLIDER_Y
    LDI r11, SLIDER_W
    LDI r8, SLIDER_H
    LDI r0, 0xFF0000
    RECT r1, r15, r11, r8, r0

    LDI r1, STR_ADDR
    STRO r1, "R"
    LDI r1, 15
    LDI r15, R_SLIDER_Y
    LDI r11, STR_ADDR
    TEXT r1, r15, r11

    ; Red slider fill
    LDI r21, RED_ADDR
    LOAD r1, r21
    LDI r15, 255
    MUL r1, r15
    LDI r15, SLIDER_W
    DIV r1, r15
    LDI r11, SLIDER_X
    LDI r9, 30
    ADD r11, r9
    LDI r8, R_SLIDER_Y
    LDI r9, 1
    ADD r8, r9
    LDI r0, 0xFF4444
    RECTF r11, r8, r1, r0, r0

    ; --- Green slider ---
    LDI r1, SLIDER_X
    LDI r15, G_SLIDER_Y
    LDI r11, SLIDER_W
    LDI r8, SLIDER_H
    LDI r0, 0x00FF00
    RECT r1, r15, r11, r8, r0

    LDI r1, STR_ADDR
    STRO r1, "G"
    LDI r1, 15
    LDI r15, G_SLIDER_Y
    LDI r11, STR_ADDR
    TEXT r1, r15, r11

    ; Green slider fill
    LDI r21, GREEN_ADDR
    LOAD r1, r21
    LDI r15, 255
    MUL r1, r15
    LDI r15, SLIDER_W
    DIV r1, r15
    LDI r11, SLIDER_X
    ADD r11, r9
    LDI r8, G_SLIDER_Y
    ADD r8, r9
    LDI r0, 0x44FF44
    RECTF r11, r8, r1, r0, r0

    ; --- Blue slider ---
    LDI r1, SLIDER_X
    LDI r15, B_SLIDER_Y
    LDI r11, SLIDER_W
    LDI r8, SLIDER_H
    LDI r0, 0x0000FF
    RECT r1, r15, r11, r8, r0

    LDI r1, STR_ADDR
    STRO r1, "B"
    LDI r1, 15
    LDI r15, B_SLIDER_Y
    LDI r11, STR_ADDR
    TEXT r1, r15, r11

    ; Blue slider fill
    LDI r21, BLUE_ADDR
    LOAD r1, r21
    LDI r15, 255
    MUL r1, r15
    LDI r15, SLIDER_W
    DIV r1, r15
    LDI r11, SLIDER_X
    ADD r11, r9
    LDI r8, B_SLIDER_Y
    ADD r8, r9
    LDI r0, 0x4444FF
    RECTF r11, r8, r1, r0, r0

    ; --- Palette (8 swatches) ---
    LDI r12, 10
    LDI r4, PAL_Y
    LDI r10, 20
    LDI r14, 20
    LDI r20, 0

pal_loop:
    CMPI r20, 0
    JNZ r6, not_p0
    LDI r0, 0xFF0000
    JMP pal_draw
not_p0:
    CMPI r20, 1
    JNZ r6, not_p1
    LDI r0, 0x00FF00
    JMP pal_draw
not_p1:
    CMPI r20, 2
    JNZ r6, not_p2
    LDI r0, 0x0000FF
    JMP pal_draw
not_p2:
    CMPI r20, 3
    JNZ r6, not_p3
    LDI r0, 0xFFFF00
    JMP pal_draw
not_p3:
    CMPI r20, 4
    JNZ r6, not_p4
    LDI r0, 0xFF00FF
    JMP pal_draw
not_p4:
    CMPI r20, 5
    JNZ r6, not_p5
    LDI r0, 0x00FFFF
    JMP pal_draw
not_p5:
    CMPI r20, 6
    JNZ r6, not_p6
    LDI r0, 0xFFFFFF
    JMP pal_draw
not_p6:
    CMPI r20, 7
    JNZ r6, pal_done
    LDI r0, 0xFF8800
    JMP pal_draw

pal_draw:
    RECTF r12, r4, r10, r14, r0
    LDI r5, 0x888888
    RECT r12, r4, r10, r14, r5
    LDI r9, 25
    ADD r12, r9
    LDI r9, 1
    ADD r20, r9
    CMPI r20, 8
    BLT r6, pal_loop

pal_done:
    ; --- Hit regions for palette ---
    LDI r12, 10
    LDI r4, PAL_Y
    LDI r10, 20
    LDI r14, 20
    HITSET r12, r4, r10, r14, 1
    LDI r9, 25
    ADD r12, r9
    HITSET r12, r4, r10, r14, 2
    ADD r12, r9
    HITSET r12, r4, r10, r14, 3
    ADD r12, r9
    HITSET r12, r4, r10, r14, 4
    ADD r12, r9
    HITSET r12, r4, r10, r14, 5
    ADD r12, r9
    HITSET r12, r4, r10, r14, 6
    ADD r12, r9
    HITSET r12, r4, r10, r14, 7
    ADD r12, r9
    HITSET r12, r4, r10, r14, 8

    ; Hit regions for sliders
    LDI r12, SLIDER_X
    LDI r10, SLIDER_W
    LDI r14, SLIDER_H
    LDI r4, R_SLIDER_Y
    HITSET r12, r4, r10, r14, 10
    LDI r4, G_SLIDER_Y
    HITSET r12, r4, r10, r14, 11
    LDI r4, B_SLIDER_Y
    HITSET r12, r4, r10, r14, 12

    ; Query mouse and hits
    MOUSEQ r5
    HITQ r2

    ; Handle palette clicks (IDs 1-8)
    CMPI r2, 1
    JNZ r6, chk_p2
    LDI r1, 0xFF0000
    LDI r21, COLOR_ADDR
    STORE r1, r21
    LDI r1, 255
    LDI r21, RED_ADDR
    STORE r1, r21
    LDI r1, 0
    LDI r21, GREEN_ADDR
    STORE r1, r21
    LDI r21, BLUE_ADDR
    STORE r1, r21
    JMP click_done

chk_p2:
    CMPI r2, 2
    JNZ r6, chk_p3
    LDI r1, 0x00FF00
    LDI r21, COLOR_ADDR
    STORE r1, r21
    LDI r1, 0
    LDI r21, RED_ADDR
    STORE r1, r21
    LDI r1, 255
    LDI r21, GREEN_ADDR
    STORE r1, r21
    LDI r21, BLUE_ADDR
    STORE r1, r21
    JMP click_done

chk_p3:
    CMPI r2, 3
    JNZ r6, chk_p4
    LDI r1, 0x0000FF
    LDI r21, COLOR_ADDR
    STORE r1, r21
    LDI r1, 0
    LDI r21, RED_ADDR
    STORE r1, r21
    LDI r21, GREEN_ADDR
    STORE r1, r21
    LDI r1, 255
    LDI r21, BLUE_ADDR
    STORE r1, r21
    JMP click_done

chk_p4:
    CMPI r2, 4
    JNZ r6, chk_p5
    LDI r1, 0xFFFF00
    LDI r21, COLOR_ADDR
    STORE r1, r21
    LDI r1, 255
    LDI r21, RED_ADDR
    STORE r1, r21
    LDI r21, GREEN_ADDR
    STORE r1, r21
    LDI r1, 0
    LDI r21, BLUE_ADDR
    STORE r1, r21
    JMP click_done

chk_p5:
    CMPI r2, 5
    JNZ r6, chk_p6
    LDI r1, 0xFF00FF
    LDI r21, COLOR_ADDR
    STORE r1, r21
    LDI r1, 255
    LDI r21, RED_ADDR
    STORE r1, r21
    LDI r1, 0
    LDI r21, GREEN_ADDR
    STORE r1, r21
    LDI r1, 255
    LDI r21, BLUE_ADDR
    STORE r1, r21
    JMP click_done

chk_p6:
    CMPI r2, 6
    JNZ r6, chk_p7
    LDI r1, 0x00FFFF
    LDI r21, COLOR_ADDR
    STORE r1, r21
    LDI r1, 0
    LDI r21, RED_ADDR
    STORE r1, r21
    LDI r1, 255
    LDI r21, GREEN_ADDR
    STORE r1, r21
    LDI r1, 255
    LDI r21, BLUE_ADDR
    STORE r1, r21
    JMP click_done

chk_p7:
    CMPI r2, 7
    JNZ r6, chk_p8
    LDI r1, 0xFFFFFF
    LDI r21, COLOR_ADDR
    STORE r1, r21
    LDI r1, 255
    LDI r21, RED_ADDR
    STORE r1, r21
    LDI r21, GREEN_ADDR
    STORE r1, r21
    LDI r21, BLUE_ADDR
    STORE r1, r21
    JMP click_done

chk_p8:
    CMPI r2, 8
    JNZ r6, click_done
    LDI r1, 0xFF8800
    LDI r21, COLOR_ADDR
    STORE r1, r21
    LDI r1, 255
    LDI r21, RED_ADDR
    STORE r1, r21
    LDI r1, 136
    LDI r21, GREEN_ADDR
    STORE r1, r21
    LDI r1, 0
    LDI r21, BLUE_ADDR
    STORE r1, r21

click_done:
    FRAME
    JMP frame_loop
