; DESCRIPTION: A red rectangle centered at the screen with fixed size.

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
    LDI r1, 0x1A1A2E
    FILL r1

    ; Title
    LDI r12, STR_ADDR
    STRO r12, "Color Picker"
    LDI r12, 90
    LDI r14, 8
    LDI r6, STR_ADDR
    TEXT r12, r14, r6

    ; Preview box - outline using RECT
    LDI r12, PREVIEW_X
    LDI r14, PREVIEW_Y
    LDI r6, PREVIEW_SZ
    LDI r5, PREVIEW_SZ
    LDI r1, 0xAAAAAA
    RECT r12, r14, r6, r5, r1

    ; Preview fill using RECTF
    LDI r21, COLOR_ADDR
    LOAD r1, r21
    RECTF r12, r14, r6, r5, r1

    ; Re-draw outline on top of fill
    LDI r1, 0xAAAAAA
    RECT r12, r14, r6, r5, r1

    ; --- Red slider ---
    LDI r12, SLIDER_X
    LDI r14, R_SLIDER_Y
    LDI r6, SLIDER_W
    LDI r5, SLIDER_H
    LDI r1, 0xFF0000
    RECT r12, r14, r6, r5, r1

    LDI r12, STR_ADDR
    STRO r12, "R"
    LDI r12, 15
    LDI r14, R_SLIDER_Y
    LDI r6, STR_ADDR
    TEXT r12, r14, r6

    ; Red slider fill
    LDI r21, RED_ADDR
    LOAD r12, r21
    LDI r14, 255
    MUL r12, r14
    LDI r14, SLIDER_W
    DIV r12, r14
    LDI r6, SLIDER_X
    LDI r11, 30
    ADD r6, r11
    LDI r5, R_SLIDER_Y
    LDI r11, 1
    ADD r5, r11
    LDI r1, 0xFF4444
    RECTF r6, r5, r12, r1, r1

    ; --- Green slider ---
    LDI r12, SLIDER_X
    LDI r14, G_SLIDER_Y
    LDI r6, SLIDER_W
    LDI r5, SLIDER_H
    LDI r1, 0x00FF00
    RECT r12, r14, r6, r5, r1

    LDI r12, STR_ADDR
    STRO r12, "G"
    LDI r12, 15
    LDI r14, G_SLIDER_Y
    LDI r6, STR_ADDR
    TEXT r12, r14, r6

    ; Green slider fill
    LDI r21, GREEN_ADDR
    LOAD r12, r21
    LDI r14, 255
    MUL r12, r14
    LDI r14, SLIDER_W
    DIV r12, r14
    LDI r6, SLIDER_X
    ADD r6, r11
    LDI r5, G_SLIDER_Y
    ADD r5, r11
    LDI r1, 0x44FF44
    RECTF r6, r5, r12, r1, r1

    ; --- Blue slider ---
    LDI r12, SLIDER_X
    LDI r14, B_SLIDER_Y
    LDI r6, SLIDER_W
    LDI r5, SLIDER_H
    LDI r1, 0x0000FF
    RECT r12, r14, r6, r5, r1

    LDI r12, STR_ADDR
    STRO r12, "B"
    LDI r12, 15
    LDI r14, B_SLIDER_Y
    LDI r6, STR_ADDR
    TEXT r12, r14, r6

    ; Blue slider fill
    LDI r21, BLUE_ADDR
    LOAD r12, r21
    LDI r14, 255
    MUL r12, r14
    LDI r14, SLIDER_W
    DIV r12, r14
    LDI r6, SLIDER_X
    ADD r6, r11
    LDI r5, B_SLIDER_Y
    ADD r5, r11
    LDI r1, 0x4444FF
    RECTF r6, r5, r12, r1, r1

    ; --- Palette (8 swatches) ---
    LDI r9, 10
    LDI r15, PAL_Y
    LDI r0, 20
    LDI r8, 20
    LDI r20, 0

pal_loop:
    CMPI r20, 0
    JNZ r2, not_p0
    LDI r1, 0xFF0000
    JMP pal_draw
not_p0:
    CMPI r20, 1
    JNZ r2, not_p1
    LDI r1, 0x00FF00
    JMP pal_draw
not_p1:
    CMPI r20, 2
    JNZ r2, not_p2
    LDI r1, 0x0000FF
    JMP pal_draw
not_p2:
    CMPI r20, 3
    JNZ r2, not_p3
    LDI r1, 0xFFFF00
    JMP pal_draw
not_p3:
    CMPI r20, 4
    JNZ r2, not_p4
    LDI r1, 0xFF00FF
    JMP pal_draw
not_p4:
    CMPI r20, 5
    JNZ r2, not_p5
    LDI r1, 0x00FFFF
    JMP pal_draw
not_p5:
    CMPI r20, 6
    JNZ r2, not_p6
    LDI r1, 0xFFFFFF
    JMP pal_draw
not_p6:
    CMPI r20, 7
    JNZ r2, pal_done
    LDI r1, 0xFF8800
    JMP pal_draw

pal_draw:
    RECTF r9, r15, r0, r8, r1
    LDI r7, 0x888888
    RECT r9, r15, r0, r8, r7
    LDI r11, 25
    ADD r9, r11
    LDI r11, 1
    ADD r20, r11
    CMPI r20, 8
    BLT r2, pal_loop

pal_done:
    ; --- Hit regions for palette ---
    LDI r9, 10
    LDI r15, PAL_Y
    LDI r0, 20
    LDI r8, 20
    HITSET r9, r15, r0, r8, 1
    LDI r11, 25
    ADD r9, r11
    HITSET r9, r15, r0, r8, 2
    ADD r9, r11
    HITSET r9, r15, r0, r8, 3
    ADD r9, r11
    HITSET r9, r15, r0, r8, 4
    ADD r9, r11
    HITSET r9, r15, r0, r8, 5
    ADD r9, r11
    HITSET r9, r15, r0, r8, 6
    ADD r9, r11
    HITSET r9, r15, r0, r8, 7
    ADD r9, r11
    HITSET r9, r15, r0, r8, 8

    ; Hit regions for sliders
    LDI r9, SLIDER_X
    LDI r0, SLIDER_W
    LDI r8, SLIDER_H
    LDI r15, R_SLIDER_Y
    HITSET r9, r15, r0, r8, 10
    LDI r15, G_SLIDER_Y
    HITSET r9, r15, r0, r8, 11
    LDI r15, B_SLIDER_Y
    HITSET r9, r15, r0, r8, 12

    ; Query mouse and hits
    MOUSEQ r7
    HITQ r13

    ; Handle palette clicks (IDs 1-8)
    CMPI r13, 1
    JNZ r2, chk_p2
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
    CMPI r13, 2
    JNZ r2, chk_p3
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
    CMPI r13, 3
    JNZ r2, chk_p4
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
    CMPI r13, 4
    JNZ r2, chk_p5
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
    CMPI r13, 5
    JNZ r2, chk_p6
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
    CMPI r13, 6
    JNZ r2, chk_p7
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
    CMPI r13, 7
    JNZ r2, chk_p8
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
    CMPI r13, 8
    JNZ r2, click_done
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
