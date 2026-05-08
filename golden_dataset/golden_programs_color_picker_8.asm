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
    LDI r6, 0xFF0000
    LDI r21, COLOR_ADDR
    STORE r6, r21
    LDI r6, 255
    LDI r21, RED_ADDR
    STORE r6, r21
    LDI r6, 0
    LDI r21, GREEN_ADDR
    STORE r6, r21
    LDI r21, BLUE_ADDR
    STORE r6, r21

frame_loop:
    ; Clear screen
    LDI r5, 0x1A1A2E
    FILL r5

    ; Title
    LDI r6, STR_ADDR
    STRO r6, "Color Picker"
    LDI r6, 90
    LDI r8, 8
    LDI r10, STR_ADDR
    TEXT r6, r8, r10

    ; Preview box - outline using RECT
    LDI r6, PREVIEW_X
    LDI r8, PREVIEW_Y
    LDI r10, PREVIEW_SZ
    LDI r2, PREVIEW_SZ
    LDI r5, 0xAAAAAA
    RECT r6, r8, r10, r2, r5

    ; Preview fill using RECTF
    LDI r21, COLOR_ADDR
    LOAD r5, r21
    RECTF r6, r8, r10, r2, r5

    ; Re-draw outline on top of fill
    LDI r5, 0xAAAAAA
    RECT r6, r8, r10, r2, r5

    ; --- Red slider ---
    LDI r6, SLIDER_X
    LDI r8, R_SLIDER_Y
    LDI r10, SLIDER_W
    LDI r2, SLIDER_H
    LDI r5, 0xFF0000
    RECT r6, r8, r10, r2, r5

    LDI r6, STR_ADDR
    STRO r6, "R"
    LDI r6, 15
    LDI r8, R_SLIDER_Y
    LDI r10, STR_ADDR
    TEXT r6, r8, r10

    ; Red slider fill
    LDI r21, RED_ADDR
    LOAD r6, r21
    LDI r8, 255
    MUL r6, r8
    LDI r8, SLIDER_W
    DIV r6, r8
    LDI r10, SLIDER_X
    LDI r4, 30
    ADD r10, r4
    LDI r2, R_SLIDER_Y
    LDI r4, 1
    ADD r2, r4
    LDI r5, 0xFF4444
    RECTF r10, r2, r6, r5, r5

    ; --- Green slider ---
    LDI r6, SLIDER_X
    LDI r8, G_SLIDER_Y
    LDI r10, SLIDER_W
    LDI r2, SLIDER_H
    LDI r5, 0x00FF00
    RECT r6, r8, r10, r2, r5

    LDI r6, STR_ADDR
    STRO r6, "G"
    LDI r6, 15
    LDI r8, G_SLIDER_Y
    LDI r10, STR_ADDR
    TEXT r6, r8, r10

    ; Green slider fill
    LDI r21, GREEN_ADDR
    LOAD r6, r21
    LDI r8, 255
    MUL r6, r8
    LDI r8, SLIDER_W
    DIV r6, r8
    LDI r10, SLIDER_X
    ADD r10, r4
    LDI r2, G_SLIDER_Y
    ADD r2, r4
    LDI r5, 0x44FF44
    RECTF r10, r2, r6, r5, r5

    ; --- Blue slider ---
    LDI r6, SLIDER_X
    LDI r8, B_SLIDER_Y
    LDI r10, SLIDER_W
    LDI r2, SLIDER_H
    LDI r5, 0x0000FF
    RECT r6, r8, r10, r2, r5

    LDI r6, STR_ADDR
    STRO r6, "B"
    LDI r6, 15
    LDI r8, B_SLIDER_Y
    LDI r10, STR_ADDR
    TEXT r6, r8, r10

    ; Blue slider fill
    LDI r21, BLUE_ADDR
    LOAD r6, r21
    LDI r8, 255
    MUL r6, r8
    LDI r8, SLIDER_W
    DIV r6, r8
    LDI r10, SLIDER_X
    ADD r10, r4
    LDI r2, B_SLIDER_Y
    ADD r2, r4
    LDI r5, 0x4444FF
    RECTF r10, r2, r6, r5, r5

    ; --- Palette (8 swatches) ---
    LDI r1, 10
    LDI r12, PAL_Y
    LDI r7, 20
    LDI r9, 20
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
    RECTF r1, r12, r7, r9, r5
    LDI r14, 0x888888
    RECT r1, r12, r7, r9, r14
    LDI r4, 25
    ADD r1, r4
    LDI r4, 1
    ADD r20, r4
    CMPI r20, 8
    BLT r15, pal_loop

pal_done:
    ; --- Hit regions for palette ---
    LDI r1, 10
    LDI r12, PAL_Y
    LDI r7, 20
    LDI r9, 20
    HITSET r1, r12, r7, r9, 1
    LDI r4, 25
    ADD r1, r4
    HITSET r1, r12, r7, r9, 2
    ADD r1, r4
    HITSET r1, r12, r7, r9, 3
    ADD r1, r4
    HITSET r1, r12, r7, r9, 4
    ADD r1, r4
    HITSET r1, r12, r7, r9, 5
    ADD r1, r4
    HITSET r1, r12, r7, r9, 6
    ADD r1, r4
    HITSET r1, r12, r7, r9, 7
    ADD r1, r4
    HITSET r1, r12, r7, r9, 8

    ; Hit regions for sliders
    LDI r1, SLIDER_X
    LDI r7, SLIDER_W
    LDI r9, SLIDER_H
    LDI r12, R_SLIDER_Y
    HITSET r1, r12, r7, r9, 10
    LDI r12, G_SLIDER_Y
    HITSET r1, r12, r7, r9, 11
    LDI r12, B_SLIDER_Y
    HITSET r1, r12, r7, r9, 12

    ; Query mouse and hits
    MOUSEQ r14
    HITQ r3

    ; Handle palette clicks (IDs 1-8)
    CMPI r3, 1
    JNZ r15, chk_p2
    LDI r6, 0xFF0000
    LDI r21, COLOR_ADDR
    STORE r6, r21
    LDI r6, 255
    LDI r21, RED_ADDR
    STORE r6, r21
    LDI r6, 0
    LDI r21, GREEN_ADDR
    STORE r6, r21
    LDI r21, BLUE_ADDR
    STORE r6, r21
    JMP click_done

chk_p2:
    CMPI r3, 2
    JNZ r15, chk_p3
    LDI r6, 0x00FF00
    LDI r21, COLOR_ADDR
    STORE r6, r21
    LDI r6, 0
    LDI r21, RED_ADDR
    STORE r6, r21
    LDI r6, 255
    LDI r21, GREEN_ADDR
    STORE r6, r21
    LDI r21, BLUE_ADDR
    STORE r6, r21
    JMP click_done

chk_p3:
    CMPI r3, 3
    JNZ r15, chk_p4
    LDI r6, 0x0000FF
    LDI r21, COLOR_ADDR
    STORE r6, r21
    LDI r6, 0
    LDI r21, RED_ADDR
    STORE r6, r21
    LDI r21, GREEN_ADDR
    STORE r6, r21
    LDI r6, 255
    LDI r21, BLUE_ADDR
    STORE r6, r21
    JMP click_done

chk_p4:
    CMPI r3, 4
    JNZ r15, chk_p5
    LDI r6, 0xFFFF00
    LDI r21, COLOR_ADDR
    STORE r6, r21
    LDI r6, 255
    LDI r21, RED_ADDR
    STORE r6, r21
    LDI r21, GREEN_ADDR
    STORE r6, r21
    LDI r6, 0
    LDI r21, BLUE_ADDR
    STORE r6, r21
    JMP click_done

chk_p5:
    CMPI r3, 5
    JNZ r15, chk_p6
    LDI r6, 0xFF00FF
    LDI r21, COLOR_ADDR
    STORE r6, r21
    LDI r6, 255
    LDI r21, RED_ADDR
    STORE r6, r21
    LDI r6, 0
    LDI r21, GREEN_ADDR
    STORE r6, r21
    LDI r6, 255
    LDI r21, BLUE_ADDR
    STORE r6, r21
    JMP click_done

chk_p6:
    CMPI r3, 6
    JNZ r15, chk_p7
    LDI r6, 0x00FFFF
    LDI r21, COLOR_ADDR
    STORE r6, r21
    LDI r6, 0
    LDI r21, RED_ADDR
    STORE r6, r21
    LDI r6, 255
    LDI r21, GREEN_ADDR
    STORE r6, r21
    LDI r6, 255
    LDI r21, BLUE_ADDR
    STORE r6, r21
    JMP click_done

chk_p7:
    CMPI r3, 7
    JNZ r15, chk_p8
    LDI r6, 0xFFFFFF
    LDI r21, COLOR_ADDR
    STORE r6, r21
    LDI r6, 255
    LDI r21, RED_ADDR
    STORE r6, r21
    LDI r21, GREEN_ADDR
    STORE r6, r21
    LDI r21, BLUE_ADDR
    STORE r6, r21
    JMP click_done

chk_p8:
    CMPI r3, 8
    JNZ r15, click_done
    LDI r6, 0xFF8800
    LDI r21, COLOR_ADDR
    STORE r6, r21
    LDI r6, 255
    LDI r21, RED_ADDR
    STORE r6, r21
    LDI r6, 136
    LDI r21, GREEN_ADDR
    STORE r6, r21
    LDI r6, 0
    LDI r21, BLUE_ADDR
    STORE r6, r21

click_done:
    FRAME
    JMP frame_loop
