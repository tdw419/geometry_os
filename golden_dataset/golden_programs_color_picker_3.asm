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
    LDI r4, 0xFF0000
    LDI r21, COLOR_ADDR
    STORE r4, r21
    LDI r4, 255
    LDI r21, RED_ADDR
    STORE r4, r21
    LDI r4, 0
    LDI r21, GREEN_ADDR
    STORE r4, r21
    LDI r21, BLUE_ADDR
    STORE r4, r21

frame_loop:
    ; Clear screen
    LDI r10, 0x1A1A2E
    FILL r10

    ; Title
    LDI r4, STR_ADDR
    STRO r4, "Color Picker"
    LDI r4, 90
    LDI r11, 8
    LDI r13, STR_ADDR
    TEXT r4, r11, r13

    ; Preview box - outline using RECT
    LDI r4, PREVIEW_X
    LDI r11, PREVIEW_Y
    LDI r13, PREVIEW_SZ
    LDI r8, PREVIEW_SZ
    LDI r10, 0xAAAAAA
    RECT r4, r11, r13, r8, r10

    ; Preview fill using RECTF
    LDI r21, COLOR_ADDR
    LOAD r10, r21
    RECTF r4, r11, r13, r8, r10

    ; Re-draw outline on top of fill
    LDI r10, 0xAAAAAA
    RECT r4, r11, r13, r8, r10

    ; --- Red slider ---
    LDI r4, SLIDER_X
    LDI r11, R_SLIDER_Y
    LDI r13, SLIDER_W
    LDI r8, SLIDER_H
    LDI r10, 0xFF0000
    RECT r4, r11, r13, r8, r10

    LDI r4, STR_ADDR
    STRO r4, "R"
    LDI r4, 15
    LDI r11, R_SLIDER_Y
    LDI r13, STR_ADDR
    TEXT r4, r11, r13

    ; Red slider fill
    LDI r21, RED_ADDR
    LOAD r4, r21
    LDI r11, 255
    MUL r4, r11
    LDI r11, SLIDER_W
    DIV r4, r11
    LDI r13, SLIDER_X
    LDI r3, 30
    ADD r13, r3
    LDI r8, R_SLIDER_Y
    LDI r3, 1
    ADD r8, r3
    LDI r10, 0xFF4444
    RECTF r13, r8, r4, r10, r10

    ; --- Green slider ---
    LDI r4, SLIDER_X
    LDI r11, G_SLIDER_Y
    LDI r13, SLIDER_W
    LDI r8, SLIDER_H
    LDI r10, 0x00FF00
    RECT r4, r11, r13, r8, r10

    LDI r4, STR_ADDR
    STRO r4, "G"
    LDI r4, 15
    LDI r11, G_SLIDER_Y
    LDI r13, STR_ADDR
    TEXT r4, r11, r13

    ; Green slider fill
    LDI r21, GREEN_ADDR
    LOAD r4, r21
    LDI r11, 255
    MUL r4, r11
    LDI r11, SLIDER_W
    DIV r4, r11
    LDI r13, SLIDER_X
    ADD r13, r3
    LDI r8, G_SLIDER_Y
    ADD r8, r3
    LDI r10, 0x44FF44
    RECTF r13, r8, r4, r10, r10

    ; --- Blue slider ---
    LDI r4, SLIDER_X
    LDI r11, B_SLIDER_Y
    LDI r13, SLIDER_W
    LDI r8, SLIDER_H
    LDI r10, 0x0000FF
    RECT r4, r11, r13, r8, r10

    LDI r4, STR_ADDR
    STRO r4, "B"
    LDI r4, 15
    LDI r11, B_SLIDER_Y
    LDI r13, STR_ADDR
    TEXT r4, r11, r13

    ; Blue slider fill
    LDI r21, BLUE_ADDR
    LOAD r4, r21
    LDI r11, 255
    MUL r4, r11
    LDI r11, SLIDER_W
    DIV r4, r11
    LDI r13, SLIDER_X
    ADD r13, r3
    LDI r8, B_SLIDER_Y
    ADD r8, r3
    LDI r10, 0x4444FF
    RECTF r13, r8, r4, r10, r10

    ; --- Palette (8 swatches) ---
    LDI r14, 10
    LDI r5, PAL_Y
    LDI r12, 20
    LDI r15, 20
    LDI r20, 0

pal_loop:
    CMPI r20, 0
    JNZ r2, not_p0
    LDI r10, 0xFF0000
    JMP pal_draw
not_p0:
    CMPI r20, 1
    JNZ r2, not_p1
    LDI r10, 0x00FF00
    JMP pal_draw
not_p1:
    CMPI r20, 2
    JNZ r2, not_p2
    LDI r10, 0x0000FF
    JMP pal_draw
not_p2:
    CMPI r20, 3
    JNZ r2, not_p3
    LDI r10, 0xFFFF00
    JMP pal_draw
not_p3:
    CMPI r20, 4
    JNZ r2, not_p4
    LDI r10, 0xFF00FF
    JMP pal_draw
not_p4:
    CMPI r20, 5
    JNZ r2, not_p5
    LDI r10, 0x00FFFF
    JMP pal_draw
not_p5:
    CMPI r20, 6
    JNZ r2, not_p6
    LDI r10, 0xFFFFFF
    JMP pal_draw
not_p6:
    CMPI r20, 7
    JNZ r2, pal_done
    LDI r10, 0xFF8800
    JMP pal_draw

pal_draw:
    RECTF r14, r5, r12, r15, r10
    LDI r0, 0x888888
    RECT r14, r5, r12, r15, r0
    LDI r3, 25
    ADD r14, r3
    LDI r3, 1
    ADD r20, r3
    CMPI r20, 8
    BLT r2, pal_loop

pal_done:
    ; --- Hit regions for palette ---
    LDI r14, 10
    LDI r5, PAL_Y
    LDI r12, 20
    LDI r15, 20
    HITSET r14, r5, r12, r15, 1
    LDI r3, 25
    ADD r14, r3
    HITSET r14, r5, r12, r15, 2
    ADD r14, r3
    HITSET r14, r5, r12, r15, 3
    ADD r14, r3
    HITSET r14, r5, r12, r15, 4
    ADD r14, r3
    HITSET r14, r5, r12, r15, 5
    ADD r14, r3
    HITSET r14, r5, r12, r15, 6
    ADD r14, r3
    HITSET r14, r5, r12, r15, 7
    ADD r14, r3
    HITSET r14, r5, r12, r15, 8

    ; Hit regions for sliders
    LDI r14, SLIDER_X
    LDI r12, SLIDER_W
    LDI r15, SLIDER_H
    LDI r5, R_SLIDER_Y
    HITSET r14, r5, r12, r15, 10
    LDI r5, G_SLIDER_Y
    HITSET r14, r5, r12, r15, 11
    LDI r5, B_SLIDER_Y
    HITSET r14, r5, r12, r15, 12

    ; Query mouse and hits
    MOUSEQ r0
    HITQ r6

    ; Handle palette clicks (IDs 1-8)
    CMPI r6, 1
    JNZ r2, chk_p2
    LDI r4, 0xFF0000
    LDI r21, COLOR_ADDR
    STORE r4, r21
    LDI r4, 255
    LDI r21, RED_ADDR
    STORE r4, r21
    LDI r4, 0
    LDI r21, GREEN_ADDR
    STORE r4, r21
    LDI r21, BLUE_ADDR
    STORE r4, r21
    JMP click_done

chk_p2:
    CMPI r6, 2
    JNZ r2, chk_p3
    LDI r4, 0x00FF00
    LDI r21, COLOR_ADDR
    STORE r4, r21
    LDI r4, 0
    LDI r21, RED_ADDR
    STORE r4, r21
    LDI r4, 255
    LDI r21, GREEN_ADDR
    STORE r4, r21
    LDI r21, BLUE_ADDR
    STORE r4, r21
    JMP click_done

chk_p3:
    CMPI r6, 3
    JNZ r2, chk_p4
    LDI r4, 0x0000FF
    LDI r21, COLOR_ADDR
    STORE r4, r21
    LDI r4, 0
    LDI r21, RED_ADDR
    STORE r4, r21
    LDI r21, GREEN_ADDR
    STORE r4, r21
    LDI r4, 255
    LDI r21, BLUE_ADDR
    STORE r4, r21
    JMP click_done

chk_p4:
    CMPI r6, 4
    JNZ r2, chk_p5
    LDI r4, 0xFFFF00
    LDI r21, COLOR_ADDR
    STORE r4, r21
    LDI r4, 255
    LDI r21, RED_ADDR
    STORE r4, r21
    LDI r21, GREEN_ADDR
    STORE r4, r21
    LDI r4, 0
    LDI r21, BLUE_ADDR
    STORE r4, r21
    JMP click_done

chk_p5:
    CMPI r6, 5
    JNZ r2, chk_p6
    LDI r4, 0xFF00FF
    LDI r21, COLOR_ADDR
    STORE r4, r21
    LDI r4, 255
    LDI r21, RED_ADDR
    STORE r4, r21
    LDI r4, 0
    LDI r21, GREEN_ADDR
    STORE r4, r21
    LDI r4, 255
    LDI r21, BLUE_ADDR
    STORE r4, r21
    JMP click_done

chk_p6:
    CMPI r6, 6
    JNZ r2, chk_p7
    LDI r4, 0x00FFFF
    LDI r21, COLOR_ADDR
    STORE r4, r21
    LDI r4, 0
    LDI r21, RED_ADDR
    STORE r4, r21
    LDI r4, 255
    LDI r21, GREEN_ADDR
    STORE r4, r21
    LDI r4, 255
    LDI r21, BLUE_ADDR
    STORE r4, r21
    JMP click_done

chk_p7:
    CMPI r6, 7
    JNZ r2, chk_p8
    LDI r4, 0xFFFFFF
    LDI r21, COLOR_ADDR
    STORE r4, r21
    LDI r4, 255
    LDI r21, RED_ADDR
    STORE r4, r21
    LDI r21, GREEN_ADDR
    STORE r4, r21
    LDI r21, BLUE_ADDR
    STORE r4, r21
    JMP click_done

chk_p8:
    CMPI r6, 8
    JNZ r2, click_done
    LDI r4, 0xFF8800
    LDI r21, COLOR_ADDR
    STORE r4, r21
    LDI r4, 255
    LDI r21, RED_ADDR
    STORE r4, r21
    LDI r4, 136
    LDI r21, GREEN_ADDR
    STORE r4, r21
    LDI r4, 0
    LDI r21, BLUE_ADDR
    STORE r4, r21

click_done:
    FRAME
    JMP frame_loop
