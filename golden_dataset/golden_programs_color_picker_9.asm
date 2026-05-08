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
    LDI r7, 0xFF0000
    LDI r21, COLOR_ADDR
    STORE r7, r21
    LDI r7, 255
    LDI r21, RED_ADDR
    STORE r7, r21
    LDI r7, 0
    LDI r21, GREEN_ADDR
    STORE r7, r21
    LDI r21, BLUE_ADDR
    STORE r7, r21

frame_loop:
    ; Clear screen
    LDI r13, 0x1A1A2E
    FILL r13

    ; Title
    LDI r7, STR_ADDR
    STRO r7, "Color Picker"
    LDI r7, 90
    LDI r5, 8
    LDI r6, STR_ADDR
    TEXT r7, r5, r6

    ; Preview box - outline using RECT
    LDI r7, PREVIEW_X
    LDI r5, PREVIEW_Y
    LDI r6, PREVIEW_SZ
    LDI r3, PREVIEW_SZ
    LDI r13, 0xAAAAAA
    RECT r7, r5, r6, r3, r13

    ; Preview fill using RECTF
    LDI r21, COLOR_ADDR
    LOAD r13, r21
    RECTF r7, r5, r6, r3, r13

    ; Re-draw outline on top of fill
    LDI r13, 0xAAAAAA
    RECT r7, r5, r6, r3, r13

    ; --- Red slider ---
    LDI r7, SLIDER_X
    LDI r5, R_SLIDER_Y
    LDI r6, SLIDER_W
    LDI r3, SLIDER_H
    LDI r13, 0xFF0000
    RECT r7, r5, r6, r3, r13

    LDI r7, STR_ADDR
    STRO r7, "R"
    LDI r7, 15
    LDI r5, R_SLIDER_Y
    LDI r6, STR_ADDR
    TEXT r7, r5, r6

    ; Red slider fill
    LDI r21, RED_ADDR
    LOAD r7, r21
    LDI r5, 255
    MUL r7, r5
    LDI r5, SLIDER_W
    DIV r7, r5
    LDI r6, SLIDER_X
    LDI r2, 30
    ADD r6, r2
    LDI r3, R_SLIDER_Y
    LDI r2, 1
    ADD r3, r2
    LDI r13, 0xFF4444
    RECTF r6, r3, r7, r13, r13

    ; --- Green slider ---
    LDI r7, SLIDER_X
    LDI r5, G_SLIDER_Y
    LDI r6, SLIDER_W
    LDI r3, SLIDER_H
    LDI r13, 0x00FF00
    RECT r7, r5, r6, r3, r13

    LDI r7, STR_ADDR
    STRO r7, "G"
    LDI r7, 15
    LDI r5, G_SLIDER_Y
    LDI r6, STR_ADDR
    TEXT r7, r5, r6

    ; Green slider fill
    LDI r21, GREEN_ADDR
    LOAD r7, r21
    LDI r5, 255
    MUL r7, r5
    LDI r5, SLIDER_W
    DIV r7, r5
    LDI r6, SLIDER_X
    ADD r6, r2
    LDI r3, G_SLIDER_Y
    ADD r3, r2
    LDI r13, 0x44FF44
    RECTF r6, r3, r7, r13, r13

    ; --- Blue slider ---
    LDI r7, SLIDER_X
    LDI r5, B_SLIDER_Y
    LDI r6, SLIDER_W
    LDI r3, SLIDER_H
    LDI r13, 0x0000FF
    RECT r7, r5, r6, r3, r13

    LDI r7, STR_ADDR
    STRO r7, "B"
    LDI r7, 15
    LDI r5, B_SLIDER_Y
    LDI r6, STR_ADDR
    TEXT r7, r5, r6

    ; Blue slider fill
    LDI r21, BLUE_ADDR
    LOAD r7, r21
    LDI r5, 255
    MUL r7, r5
    LDI r5, SLIDER_W
    DIV r7, r5
    LDI r6, SLIDER_X
    ADD r6, r2
    LDI r3, B_SLIDER_Y
    ADD r3, r2
    LDI r13, 0x4444FF
    RECTF r6, r3, r7, r13, r13

    ; --- Palette (8 swatches) ---
    LDI r14, 10
    LDI r10, PAL_Y
    LDI r4, 20
    LDI r8, 20
    LDI r20, 0

pal_loop:
    CMPI r20, 0
    JNZ r1, not_p0
    LDI r13, 0xFF0000
    JMP pal_draw
not_p0:
    CMPI r20, 1
    JNZ r1, not_p1
    LDI r13, 0x00FF00
    JMP pal_draw
not_p1:
    CMPI r20, 2
    JNZ r1, not_p2
    LDI r13, 0x0000FF
    JMP pal_draw
not_p2:
    CMPI r20, 3
    JNZ r1, not_p3
    LDI r13, 0xFFFF00
    JMP pal_draw
not_p3:
    CMPI r20, 4
    JNZ r1, not_p4
    LDI r13, 0xFF00FF
    JMP pal_draw
not_p4:
    CMPI r20, 5
    JNZ r1, not_p5
    LDI r13, 0x00FFFF
    JMP pal_draw
not_p5:
    CMPI r20, 6
    JNZ r1, not_p6
    LDI r13, 0xFFFFFF
    JMP pal_draw
not_p6:
    CMPI r20, 7
    JNZ r1, pal_done
    LDI r13, 0xFF8800
    JMP pal_draw

pal_draw:
    RECTF r14, r10, r4, r8, r13
    LDI r12, 0x888888
    RECT r14, r10, r4, r8, r12
    LDI r2, 25
    ADD r14, r2
    LDI r2, 1
    ADD r20, r2
    CMPI r20, 8
    BLT r1, pal_loop

pal_done:
    ; --- Hit regions for palette ---
    LDI r14, 10
    LDI r10, PAL_Y
    LDI r4, 20
    LDI r8, 20
    HITSET r14, r10, r4, r8, 1
    LDI r2, 25
    ADD r14, r2
    HITSET r14, r10, r4, r8, 2
    ADD r14, r2
    HITSET r14, r10, r4, r8, 3
    ADD r14, r2
    HITSET r14, r10, r4, r8, 4
    ADD r14, r2
    HITSET r14, r10, r4, r8, 5
    ADD r14, r2
    HITSET r14, r10, r4, r8, 6
    ADD r14, r2
    HITSET r14, r10, r4, r8, 7
    ADD r14, r2
    HITSET r14, r10, r4, r8, 8

    ; Hit regions for sliders
    LDI r14, SLIDER_X
    LDI r4, SLIDER_W
    LDI r8, SLIDER_H
    LDI r10, R_SLIDER_Y
    HITSET r14, r10, r4, r8, 10
    LDI r10, G_SLIDER_Y
    HITSET r14, r10, r4, r8, 11
    LDI r10, B_SLIDER_Y
    HITSET r14, r10, r4, r8, 12

    ; Query mouse and hits
    MOUSEQ r12
    HITQ r15

    ; Handle palette clicks (IDs 1-8)
    CMPI r15, 1
    JNZ r1, chk_p2
    LDI r7, 0xFF0000
    LDI r21, COLOR_ADDR
    STORE r7, r21
    LDI r7, 255
    LDI r21, RED_ADDR
    STORE r7, r21
    LDI r7, 0
    LDI r21, GREEN_ADDR
    STORE r7, r21
    LDI r21, BLUE_ADDR
    STORE r7, r21
    JMP click_done

chk_p2:
    CMPI r15, 2
    JNZ r1, chk_p3
    LDI r7, 0x00FF00
    LDI r21, COLOR_ADDR
    STORE r7, r21
    LDI r7, 0
    LDI r21, RED_ADDR
    STORE r7, r21
    LDI r7, 255
    LDI r21, GREEN_ADDR
    STORE r7, r21
    LDI r21, BLUE_ADDR
    STORE r7, r21
    JMP click_done

chk_p3:
    CMPI r15, 3
    JNZ r1, chk_p4
    LDI r7, 0x0000FF
    LDI r21, COLOR_ADDR
    STORE r7, r21
    LDI r7, 0
    LDI r21, RED_ADDR
    STORE r7, r21
    LDI r21, GREEN_ADDR
    STORE r7, r21
    LDI r7, 255
    LDI r21, BLUE_ADDR
    STORE r7, r21
    JMP click_done

chk_p4:
    CMPI r15, 4
    JNZ r1, chk_p5
    LDI r7, 0xFFFF00
    LDI r21, COLOR_ADDR
    STORE r7, r21
    LDI r7, 255
    LDI r21, RED_ADDR
    STORE r7, r21
    LDI r21, GREEN_ADDR
    STORE r7, r21
    LDI r7, 0
    LDI r21, BLUE_ADDR
    STORE r7, r21
    JMP click_done

chk_p5:
    CMPI r15, 5
    JNZ r1, chk_p6
    LDI r7, 0xFF00FF
    LDI r21, COLOR_ADDR
    STORE r7, r21
    LDI r7, 255
    LDI r21, RED_ADDR
    STORE r7, r21
    LDI r7, 0
    LDI r21, GREEN_ADDR
    STORE r7, r21
    LDI r7, 255
    LDI r21, BLUE_ADDR
    STORE r7, r21
    JMP click_done

chk_p6:
    CMPI r15, 6
    JNZ r1, chk_p7
    LDI r7, 0x00FFFF
    LDI r21, COLOR_ADDR
    STORE r7, r21
    LDI r7, 0
    LDI r21, RED_ADDR
    STORE r7, r21
    LDI r7, 255
    LDI r21, GREEN_ADDR
    STORE r7, r21
    LDI r7, 255
    LDI r21, BLUE_ADDR
    STORE r7, r21
    JMP click_done

chk_p7:
    CMPI r15, 7
    JNZ r1, chk_p8
    LDI r7, 0xFFFFFF
    LDI r21, COLOR_ADDR
    STORE r7, r21
    LDI r7, 255
    LDI r21, RED_ADDR
    STORE r7, r21
    LDI r21, GREEN_ADDR
    STORE r7, r21
    LDI r21, BLUE_ADDR
    STORE r7, r21
    JMP click_done

chk_p8:
    CMPI r15, 8
    JNZ r1, click_done
    LDI r7, 0xFF8800
    LDI r21, COLOR_ADDR
    STORE r7, r21
    LDI r7, 255
    LDI r21, RED_ADDR
    STORE r7, r21
    LDI r7, 136
    LDI r21, GREEN_ADDR
    STORE r7, r21
    LDI r7, 0
    LDI r21, BLUE_ADDR
    STORE r7, r21

click_done:
    FRAME
    JMP frame_loop
