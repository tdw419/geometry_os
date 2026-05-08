; DESCRIPTION: Render a red rectangle at the screen.

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
    LDI r12, 0xFF0000
    LDI r21, COLOR_ADDR
    STORE r12, r21
    LDI r12, 255
    LDI r21, RED_ADDR
    STORE r12, r21
    LDI r12, 0
    LDI r21, GREEN_ADDR
    STORE r12, r21
    LDI r21, BLUE_ADDR
    STORE r12, r21

frame_loop:
    ; Clear screen
    LDI r13, 0x1A1A2E
    FILL r13

    ; Title
    LDI r12, STR_ADDR
    STRO r12, "Color Picker"
    LDI r12, 90
    LDI r5, 8
    LDI r0, STR_ADDR
    TEXT r12, r5, r0

    ; Preview box - outline using RECT
    LDI r12, PREVIEW_X
    LDI r5, PREVIEW_Y
    LDI r0, PREVIEW_SZ
    LDI r1, PREVIEW_SZ
    LDI r13, 0xAAAAAA
    RECT r12, r5, r0, r1, r13

    ; Preview fill using RECTF
    LDI r21, COLOR_ADDR
    LOAD r13, r21
    RECTF r12, r5, r0, r1, r13

    ; Re-draw outline on top of fill
    LDI r13, 0xAAAAAA
    RECT r12, r5, r0, r1, r13

    ; --- Red slider ---
    LDI r12, SLIDER_X
    LDI r5, R_SLIDER_Y
    LDI r0, SLIDER_W
    LDI r1, SLIDER_H
    LDI r13, 0xFF0000
    RECT r12, r5, r0, r1, r13

    LDI r12, STR_ADDR
    STRO r12, "R"
    LDI r12, 15
    LDI r5, R_SLIDER_Y
    LDI r0, STR_ADDR
    TEXT r12, r5, r0

    ; Red slider fill
    LDI r21, RED_ADDR
    LOAD r12, r21
    LDI r5, 255
    MUL r12, r5
    LDI r5, SLIDER_W
    DIV r12, r5
    LDI r0, SLIDER_X
    LDI r15, 30
    ADD r0, r15
    LDI r1, R_SLIDER_Y
    LDI r15, 1
    ADD r1, r15
    LDI r13, 0xFF4444
    RECTF r0, r1, r12, r13, r13

    ; --- Green slider ---
    LDI r12, SLIDER_X
    LDI r5, G_SLIDER_Y
    LDI r0, SLIDER_W
    LDI r1, SLIDER_H
    LDI r13, 0x00FF00
    RECT r12, r5, r0, r1, r13

    LDI r12, STR_ADDR
    STRO r12, "G"
    LDI r12, 15
    LDI r5, G_SLIDER_Y
    LDI r0, STR_ADDR
    TEXT r12, r5, r0

    ; Green slider fill
    LDI r21, GREEN_ADDR
    LOAD r12, r21
    LDI r5, 255
    MUL r12, r5
    LDI r5, SLIDER_W
    DIV r12, r5
    LDI r0, SLIDER_X
    ADD r0, r15
    LDI r1, G_SLIDER_Y
    ADD r1, r15
    LDI r13, 0x44FF44
    RECTF r0, r1, r12, r13, r13

    ; --- Blue slider ---
    LDI r12, SLIDER_X
    LDI r5, B_SLIDER_Y
    LDI r0, SLIDER_W
    LDI r1, SLIDER_H
    LDI r13, 0x0000FF
    RECT r12, r5, r0, r1, r13

    LDI r12, STR_ADDR
    STRO r12, "B"
    LDI r12, 15
    LDI r5, B_SLIDER_Y
    LDI r0, STR_ADDR
    TEXT r12, r5, r0

    ; Blue slider fill
    LDI r21, BLUE_ADDR
    LOAD r12, r21
    LDI r5, 255
    MUL r12, r5
    LDI r5, SLIDER_W
    DIV r12, r5
    LDI r0, SLIDER_X
    ADD r0, r15
    LDI r1, B_SLIDER_Y
    ADD r1, r15
    LDI r13, 0x4444FF
    RECTF r0, r1, r12, r13, r13

    ; --- Palette (8 swatches) ---
    LDI r7, 10
    LDI r4, PAL_Y
    LDI r2, 20
    LDI r11, 20
    LDI r20, 0

pal_loop:
    CMPI r20, 0
    JNZ r10, not_p0
    LDI r13, 0xFF0000
    JMP pal_draw
not_p0:
    CMPI r20, 1
    JNZ r10, not_p1
    LDI r13, 0x00FF00
    JMP pal_draw
not_p1:
    CMPI r20, 2
    JNZ r10, not_p2
    LDI r13, 0x0000FF
    JMP pal_draw
not_p2:
    CMPI r20, 3
    JNZ r10, not_p3
    LDI r13, 0xFFFF00
    JMP pal_draw
not_p3:
    CMPI r20, 4
    JNZ r10, not_p4
    LDI r13, 0xFF00FF
    JMP pal_draw
not_p4:
    CMPI r20, 5
    JNZ r10, not_p5
    LDI r13, 0x00FFFF
    JMP pal_draw
not_p5:
    CMPI r20, 6
    JNZ r10, not_p6
    LDI r13, 0xFFFFFF
    JMP pal_draw
not_p6:
    CMPI r20, 7
    JNZ r10, pal_done
    LDI r13, 0xFF8800
    JMP pal_draw

pal_draw:
    RECTF r7, r4, r2, r11, r13
    LDI r14, 0x888888
    RECT r7, r4, r2, r11, r14
    LDI r15, 25
    ADD r7, r15
    LDI r15, 1
    ADD r20, r15
    CMPI r20, 8
    BLT r10, pal_loop

pal_done:
    ; --- Hit regions for palette ---
    LDI r7, 10
    LDI r4, PAL_Y
    LDI r2, 20
    LDI r11, 20
    HITSET r7, r4, r2, r11, 1
    LDI r15, 25
    ADD r7, r15
    HITSET r7, r4, r2, r11, 2
    ADD r7, r15
    HITSET r7, r4, r2, r11, 3
    ADD r7, r15
    HITSET r7, r4, r2, r11, 4
    ADD r7, r15
    HITSET r7, r4, r2, r11, 5
    ADD r7, r15
    HITSET r7, r4, r2, r11, 6
    ADD r7, r15
    HITSET r7, r4, r2, r11, 7
    ADD r7, r15
    HITSET r7, r4, r2, r11, 8

    ; Hit regions for sliders
    LDI r7, SLIDER_X
    LDI r2, SLIDER_W
    LDI r11, SLIDER_H
    LDI r4, R_SLIDER_Y
    HITSET r7, r4, r2, r11, 10
    LDI r4, G_SLIDER_Y
    HITSET r7, r4, r2, r11, 11
    LDI r4, B_SLIDER_Y
    HITSET r7, r4, r2, r11, 12

    ; Query mouse and hits
    MOUSEQ r14
    HITQ r8

    ; Handle palette clicks (IDs 1-8)
    CMPI r8, 1
    JNZ r10, chk_p2
    LDI r12, 0xFF0000
    LDI r21, COLOR_ADDR
    STORE r12, r21
    LDI r12, 255
    LDI r21, RED_ADDR
    STORE r12, r21
    LDI r12, 0
    LDI r21, GREEN_ADDR
    STORE r12, r21
    LDI r21, BLUE_ADDR
    STORE r12, r21
    JMP click_done

chk_p2:
    CMPI r8, 2
    JNZ r10, chk_p3
    LDI r12, 0x00FF00
    LDI r21, COLOR_ADDR
    STORE r12, r21
    LDI r12, 0
    LDI r21, RED_ADDR
    STORE r12, r21
    LDI r12, 255
    LDI r21, GREEN_ADDR
    STORE r12, r21
    LDI r21, BLUE_ADDR
    STORE r12, r21
    JMP click_done

chk_p3:
    CMPI r8, 3
    JNZ r10, chk_p4
    LDI r12, 0x0000FF
    LDI r21, COLOR_ADDR
    STORE r12, r21
    LDI r12, 0
    LDI r21, RED_ADDR
    STORE r12, r21
    LDI r21, GREEN_ADDR
    STORE r12, r21
    LDI r12, 255
    LDI r21, BLUE_ADDR
    STORE r12, r21
    JMP click_done

chk_p4:
    CMPI r8, 4
    JNZ r10, chk_p5
    LDI r12, 0xFFFF00
    LDI r21, COLOR_ADDR
    STORE r12, r21
    LDI r12, 255
    LDI r21, RED_ADDR
    STORE r12, r21
    LDI r21, GREEN_ADDR
    STORE r12, r21
    LDI r12, 0
    LDI r21, BLUE_ADDR
    STORE r12, r21
    JMP click_done

chk_p5:
    CMPI r8, 5
    JNZ r10, chk_p6
    LDI r12, 0xFF00FF
    LDI r21, COLOR_ADDR
    STORE r12, r21
    LDI r12, 255
    LDI r21, RED_ADDR
    STORE r12, r21
    LDI r12, 0
    LDI r21, GREEN_ADDR
    STORE r12, r21
    LDI r12, 255
    LDI r21, BLUE_ADDR
    STORE r12, r21
    JMP click_done

chk_p6:
    CMPI r8, 6
    JNZ r10, chk_p7
    LDI r12, 0x00FFFF
    LDI r21, COLOR_ADDR
    STORE r12, r21
    LDI r12, 0
    LDI r21, RED_ADDR
    STORE r12, r21
    LDI r12, 255
    LDI r21, GREEN_ADDR
    STORE r12, r21
    LDI r12, 255
    LDI r21, BLUE_ADDR
    STORE r12, r21
    JMP click_done

chk_p7:
    CMPI r8, 7
    JNZ r10, chk_p8
    LDI r12, 0xFFFFFF
    LDI r21, COLOR_ADDR
    STORE r12, r21
    LDI r12, 255
    LDI r21, RED_ADDR
    STORE r12, r21
    LDI r21, GREEN_ADDR
    STORE r12, r21
    LDI r21, BLUE_ADDR
    STORE r12, r21
    JMP click_done

chk_p8:
    CMPI r8, 8
    JNZ r10, click_done
    LDI r12, 0xFF8800
    LDI r21, COLOR_ADDR
    STORE r12, r21
    LDI r12, 255
    LDI r21, RED_ADDR
    STORE r12, r21
    LDI r12, 136
    LDI r21, GREEN_ADDR
    STORE r12, r21
    LDI r12, 0
    LDI r21, BLUE_ADDR
    STORE r12, r21

click_done:
    FRAME
    JMP frame_loop
