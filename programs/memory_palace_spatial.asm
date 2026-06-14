; Spatial Memory Palace for Geometry OS
; Center pixel (128, 128) = YOU
; Inner ring (radius 30) = CRITICAL facts
; Mid ring (radius 70) = IMPORTANT facts
; Outer ring (radius 120) = REFERENCE facts

; Color definitions
COLOR_CENTER    EQU 0xFFFFFF   ; White (you)
COLOR_INNER     EQU 0xFF0000   ; Red (critical)
COLOR_MID       EQU 0x00FF00   ; Green (important)
COLOR_OUTER     EQU 0x0000FF   ; Blue (reference)
COLOR_TEXT      EQU 0xFFFFFF   ; White text
COLOR_BG        EQU 0x000000   ; Black background

; Screen constants
SCREEN_WIDTH    EQU 256
SCREEN_HEIGHT   EQU 256
CENTER_X         EQU 128
CENTER_Y         EQU 128

; Ring radii
RADIUS_INNER     EQU 30
RADIUS_MID       EQU 70
RADIUS_OUTER     EQU 120

; Registers
r0 = temp
r1 = x
r2 = y
r3 = radius
r4 = dx
r5 = dy
r6 = dist_sq
r7 = color
r28 = pixel_addr
r29 = key

; Start
LDI r0, 0              ; Clear screen
LDI r28, 0
CLEAR_SCREEN:
    LDI r1, 0x000000
    STO r1, [r28]
    ADDI r28, 1
    CMP r28, 65536      ; 256 * 256
    JZ CLEAR_SCREEN

; Draw center pixel (YOU)
LDI r28, (CENTER_Y * SCREEN_WIDTH + CENTER_X)
LDI r1, COLOR_CENTER
STO r1, [r28]

; Draw inner ring (red) - 4 critical facts
LDI r7, COLOR_INNER
LDI r3, RADIUS_INNER
LDI r0, 4              ; 4 facts
CALL DRAW_RING_POINTS

; Draw mid ring (green) - 10 important facts
LDI r7, COLOR_MID
LDI r3, RADIUS_MID
LDI r0, 10             ; 10 facts
CALL DRAW_RING_POINTS

; Draw outer ring (blue) - 37 reference facts
LDI r7, COLOR_OUTER
LDI r3, RADIUS_OUTER
LDI r0, 37             ; 37 facts
CALL DRAW_RING_POINTS

; Add navigation instructions
LDI r28, 10            ; Line 10
CALL DRAW_INSTRUCTIONS

; Main loop - handle arrow keys for navigation
MAIN_LOOP:
    ; Read key port (0xFFFF)
    LDI r29, 0xFFFF
    LDI r0, 0
    LOD r29, [r0]

    ; Check for arrow keys
    CMP r29, 0x80       ; Up
    JZ NAV_UP
    CMP r29, 0x81       ; Down
    JZ NAV_DOWN
    CMP r29, 0x82       ; Left
    JZ NAV_LEFT
    CMP r29, 0x83       ; Right
    JZ NAV_RIGHT

    ; Check for 'q' to quit
    CMP r29, 0x71       ; 'q'
    JZ QUIT

    ; Small delay
    LDI r0, 10000
DELAY:
    SUBI r0, 1
    JNZ DELAY

    JMP MAIN_LOOP

; Navigation routines
NAV_UP:
    ; Move inner ring facts up (rotate)
    JMP MAIN_LOOP

NAV_DOWN:
    ; Move inner ring facts down (rotate)
    JMP MAIN_LOOP

NAV_LEFT:
    ; Navigate to outer ring
    JMP MAIN_LOOP

NAV_RIGHT:
    ; Navigate to inner ring
    JMP MAIN_LOOP

QUIT:
    HLT

; Draw points around a ring
; r0 = number of points
; r3 = radius
; r7 = color
DRAW_RING_POINTS:
    PUSH r0
    PUSH r3
    PUSH r7

    LDI r1, 0           ; angle counter
DRAW_LOOP:
    CMP r1, r0
    JZ DRAW_END

    ; Calculate position using circle approximation
    ; x = center_x + radius * cos(angle)
    ; y = center_y + radius * sin(angle)
    ; Use lookup table for 8 directions

    ; Simple 8-direction distribution
    MOV r2, r1          ; angle
    MODI r2, 8          ; 8 directions

    ; Direction lookup
    LDI r4, DIRECTIONS
    ADD r4, r2          ; index into table
    LOD r4, [r4]        ; dx

    LDI r5, DIRECTIONS + 1
    ADD r5, r2
    LOD r5, [r5]        ; dy

    ; Scale by radius
    MUL r4, r3
    MUL r5, r3
    DIVI r4, 3
    DIVI r5, 3

    ; Add center
    ADDI r4, CENTER_X
    ADDI r5, CENTER_Y

    ; Clamp to screen
    JN DRAW_SKIP_NEG_X
    CMP r4, SCREEN_WIDTH
    JGE DRAW_SKIP_NEG_X

    JN DRAW_SKIP_NEG_Y
    CMP r5, SCREEN_HEIGHT
    JGE DRAW_SKIP_NEG_Y

    ; Draw pixel
    MUL r5, SCREEN_WIDTH
    ADD r4, r5
    MOV r28, r4
    STO r7, [r28]

DRAW_SKIP_NEG_Y:
DRAW_SKIP_NEG_X:
    ADDI r1, 1
    JMP DRAW_LOOP

DRAW_END:
    POP r7
    POP r3
    POP r0
    RET

; Draw instructions at top of screen
DRAW_INSTRUCTIONS:
    ; Simply draw some indicator pixels
    LDI r1, 0
DRAW_TEXT_LOOP:
    CMP r1, SCREEN_WIDTH
    JGE DRAW_TEXT_END

    ; Draw alternating pixels for readability
    MODI r1, 2
    JZ DRAW_TEXT_WHITE
    JMP DRAW_TEXT_BLACK

DRAW_TEXT_WHITE:
    MOV r28, r1
    LDI r2, COLOR_TEXT
    STO r2, [r28]
    ADDI r1, 1
    JMP DRAW_TEXT_LOOP

DRAW_TEXT_BLACK:
    ADDI r1, 1
    JMP DRAW_TEXT_LOOP

DRAW_TEXT_END:
    RET

; Direction lookup table (dx, dy pairs)
DIRECTIONS:
    DW 1, 0      ; Right
    DW 1, 1      ; Down-Right
    DW 0, 1      ; Down
    DW -1, 1     ; Down-Left
    DW -1, 0     ; Left
    DW -1, -1    ; Up-Left
    DW 0, -1     ; Up
    DW 1, -1     ; Up-Right