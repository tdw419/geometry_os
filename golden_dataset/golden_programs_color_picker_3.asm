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
    LDI r9, 0xFF0000
    LDI r21, COLOR_ADDR
    STORE r9, r21
    LDI r9, 255
    LDI r21, RED_ADDR
    STORE r9, r21
    LDI r9, 0
    LDI r21, GREEN_ADDR
    STORE r9, r21
    LDI r21, BLUE_ADDR
    STORE r9, r21

frame_loop:
    ; Clear screen
    LDI r12, 0x1A1A2E
    FILL r12

    ; Title
    LDI r9, STR_ADDR
    STRO r9, "Color Picker"
    LDI r9, 90
    LDI r1, 8
    LDI r14, STR_ADDR
    TEXT r9, r1, r14

    ; Preview box - outline using RECT
    LDI r9, PREVIEW_X
    LDI r1, PREVIEW_Y
    LDI r14, PREVIEW_SZ
    LDI r4, PREVIEW_SZ
    LDI r12, 0xAAAAAA
    RECT r9, r1, r14, r4, r12

    ; Preview fill using RECTF
    LDI r21, COLOR_ADDR
    LOAD r12, r21
    RECTF r9, r1, r14, r4, r12

    ; Re-draw outline on top of fill
    LDI r12, 0xAAAAAA
    RECT r9, r1, r14, r4, r12

    ; --- Red slider ---
    LDI r9, SLIDER_X
    LDI r1, R_SLIDER_Y
    LDI r14, SLIDER_W
    LDI r4, SLIDER_H
    LDI r12, 0xFF0000
    RECT r9, r1, r14, r4, r12

    LDI r9, STR_ADDR
    STRO r9, "R"
    LDI r9, 15
    LDI r1, R_SLIDER_Y
    LDI r14, STR_ADDR
    TEXT r9, r1, r14

    ; Red slider fill
    LDI r21, RED_ADDR
    LOAD r9, r21
    LDI r1, 255
    MUL r9, r1
    LDI r1, SLIDER_W
    DIV r9, r1
    LDI r14, SLIDER_X
    LDI r15, 30
    ADD r14, r15
    LDI r4, R_SLIDER_Y
    LDI r15, 1
    ADD r4, r15
    LDI r12, 0xFF4444
    RECTF r14, r4, r9, r12, r12

    ; --- Green slider ---
    LDI r9, SLIDER_X
    LDI r1, G_SLIDER_Y
    LDI r14, SLIDER_W
    LDI r4, SLIDER_H
    LDI r12, 0x00FF00
    RECT r9, r1, r14, r4, r12

    LDI r9, STR_ADDR
    STRO r9, "G"
    LDI r9, 15
    LDI r1, G_SLIDER_Y
    LDI r14, STR_ADDR
    TEXT r9, r1, r14

    ; Green slider fill
    LDI r21, GREEN_ADDR
    LOAD r9, r21
    LDI r1, 255
    MUL r9, r1
    LDI r1, SLIDER_W
    DIV r9, r1
    LDI r14, SLIDER_X
    ADD r14, r15
    LDI r4, G_SLIDER_Y
    ADD r4, r15
    LDI r12, 0x44FF44
    RECTF r14, r4, r9, r12, r12

    ; --- Blue slider ---
    LDI r9, SLIDER_X
    LDI r1, B_SLIDER_Y
    LDI r14, SLIDER_W
    LDI r4, SLIDER_H
    LDI r12, 0x0000FF
    RECT r9, r1, r14, r4, r12

    LDI r9, STR_ADDR
    STRO r9, "B"
    LDI r9, 15
    LDI r1, B_SLIDER_Y
    LDI r14, STR_ADDR
    TEXT r9, r1, r14

    ; Blue slider fill
    LDI r21, BLUE_ADDR
    LOAD r9, r21
    LDI r1, 255
    MUL r9, r1
    LDI r1, SLIDER_W
    DIV r9, r1
    LDI r14, SLIDER_X
    ADD r14, r15
    LDI r4, B_SLIDER_Y
    ADD r4, r15
    LDI r12, 0x4444FF
    RECTF r14, r4, r9, r12, r12

    ; --- Palette (8 swatches) ---
    LDI r7, 10
    LDI r10, PAL_Y
    LDI r2, 20
    LDI r0, 20
    LDI r20, 0

pal_loop:
    CMPI r20, 0
    JNZ r6, not_p0
    LDI r12, 0xFF0000
    JMP pal_draw
not_p0:
    CMPI r20, 1
    JNZ r6, not_p1
    LDI r12, 0x00FF00
    JMP pal_draw
not_p1:
    CMPI r20, 2
    JNZ r6, not_p2
    LDI r12, 0x0000FF
    JMP pal_draw
not_p2:
    CMPI r20, 3
    JNZ r6, not_p3
    LDI r12, 0xFFFF00
    JMP pal_draw
not_p3:
    CMPI r20, 4
    JNZ r6, not_p4
    LDI r12, 0xFF00FF
    JMP pal_draw
not_p4:
    CMPI r20, 5
    JNZ r6, not_p5
    LDI r12, 0x00FFFF
    JMP pal_draw
not_p5:
    CMPI r20, 6
    JNZ r6, not_p6
    LDI r12, 0xFFFFFF
    JMP pal_draw
not_p6:
    CMPI r20, 7
    JNZ r6, pal_done
    LDI r12, 0xFF8800
    JMP pal_draw

pal_draw:
    RECTF r7, r10, r2, r0, r12
    LDI r13, 0x888888
    RECT r7, r10, r2, r0, r13
    LDI r15, 25
    ADD r7, r15
    LDI r15, 1
    ADD r20, r15
    CMPI r20, 8
    BLT r6, pal_loop

pal_done:
    ; --- Hit regions for palette ---
    LDI r7, 10
    LDI r10, PAL_Y
    LDI r2, 20
    LDI r0, 20
    HITSET r7, r10, r2, r0, 1
    LDI r15, 25
    ADD r7, r15
    HITSET r7, r10, r2, r0, 2
    ADD r7, r15
    HITSET r7, r10, r2, r0, 3
    ADD r7, r15
    HITSET r7, r10, r2, r0, 4
    ADD r7, r15
    HITSET r7, r10, r2, r0, 5
    ADD r7, r15
    HITSET r7, r10, r2, r0, 6
    ADD r7, r15
    HITSET r7, r10, r2, r0, 7
    ADD r7, r15
    HITSET r7, r10, r2, r0, 8

    ; Hit regions for sliders
    LDI r7, SLIDER_X
    LDI r2, SLIDER_W
    LDI r0, SLIDER_H
    LDI r10, R_SLIDER_Y
    HITSET r7, r10, r2, r0, 10
    LDI r10, G_SLIDER_Y
    HITSET r7, r10, r2, r0, 11
    LDI r10, B_SLIDER_Y
    HITSET r7, r10, r2, r0, 12

    ; Query mouse and hits
    MOUSEQ r13
    HITQ r3

    ; Handle palette clicks (IDs 1-8)
    CMPI r3, 1
    JNZ r6, chk_p2
    LDI r9, 0xFF0000
    LDI r21, COLOR_ADDR
    STORE r9, r21
    LDI r9, 255
    LDI r21, RED_ADDR
    STORE r9, r21
    LDI r9, 0
    LDI r21, GREEN_ADDR
    STORE r9, r21
    LDI r21, BLUE_ADDR
    STORE r9, r21
    JMP click_done

chk_p2:
    CMPI r3, 2
    JNZ r6, chk_p3
    LDI r9, 0x00FF00
    LDI r21, COLOR_ADDR
    STORE r9, r21
    LDI r9, 0
    LDI r21, RED_ADDR
    STORE r9, r21
    LDI r9, 255
    LDI r21, GREEN_ADDR
    STORE r9, r21
    LDI r21, BLUE_ADDR
    STORE r9, r21
    JMP click_done

chk_p3:
    CMPI r3, 3
    JNZ r6, chk_p4
    LDI r9, 0x0000FF
    LDI r21, COLOR_ADDR
    STORE r9, r21
    LDI r9, 0
    LDI r21, RED_ADDR
    STORE r9, r21
    LDI r21, GREEN_ADDR
    STORE r9, r21
    LDI r9, 255
    LDI r21, BLUE_ADDR
    STORE r9, r21
    JMP click_done

chk_p4:
    CMPI r3, 4
    JNZ r6, chk_p5
    LDI r9, 0xFFFF00
    LDI r21, COLOR_ADDR
    STORE r9, r21
    LDI r9, 255
    LDI r21, RED_ADDR
    STORE r9, r21
    LDI r21, GREEN_ADDR
    STORE r9, r21
    LDI r9, 0
    LDI r21, BLUE_ADDR
    STORE r9, r21
    JMP click_done

chk_p5:
    CMPI r3, 5
    JNZ r6, chk_p6
    LDI r9, 0xFF00FF
    LDI r21, COLOR_ADDR
    STORE r9, r21
    LDI r9, 255
    LDI r21, RED_ADDR
    STORE r9, r21
    LDI r9, 0
    LDI r21, GREEN_ADDR
    STORE r9, r21
    LDI r9, 255
    LDI r21, BLUE_ADDR
    STORE r9, r21
    JMP click_done

chk_p6:
    CMPI r3, 6
    JNZ r6, chk_p7
    LDI r9, 0x00FFFF
    LDI r21, COLOR_ADDR
    STORE r9, r21
    LDI r9, 0
    LDI r21, RED_ADDR
    STORE r9, r21
    LDI r9, 255
    LDI r21, GREEN_ADDR
    STORE r9, r21
    LDI r9, 255
    LDI r21, BLUE_ADDR
    STORE r9, r21
    JMP click_done

chk_p7:
    CMPI r3, 7
    JNZ r6, chk_p8
    LDI r9, 0xFFFFFF
    LDI r21, COLOR_ADDR
    STORE r9, r21
    LDI r9, 255
    LDI r21, RED_ADDR
    STORE r9, r21
    LDI r21, GREEN_ADDR
    STORE r9, r21
    LDI r21, BLUE_ADDR
    STORE r9, r21
    JMP click_done

chk_p8:
    CMPI r3, 8
    JNZ r6, click_done
    LDI r9, 0xFF8800
    LDI r21, COLOR_ADDR
    STORE r9, r21
    LDI r9, 255
    LDI r21, RED_ADDR
    STORE r9, r21
    LDI r9, 136
    LDI r21, GREEN_ADDR
    STORE r9, r21
    LDI r9, 0
    LDI r21, BLUE_ADDR
    STORE r9, r21

click_done:
    FRAME
    JMP frame_loop
