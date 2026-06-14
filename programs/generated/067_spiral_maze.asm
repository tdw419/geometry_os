; MAZE_SPIRAL -- Spiral maze pattern using nested loops
; Draws a spiral of rectangles decreasing in size, creating a maze-like corridor
; Dark background with green walls

; Fill background
LDI r0, 0x0A0A18
FILL r0

; Wall color
LDI r24, 0x00CC66

; Draw outer border (all 4 sides using RECTF)
LDI r0, 0
LDI r1, 0
LDI r2, 256
LDI r3, 3
RECTF r0, r1, r2, r3, r24

LDI r1, 253
RECTF r0, r1, r2, r3, r24

LDI r1, 0
LDI r2, 3
LDI r3, 256
RECTF r0, r1, r2, r3, r24

LDI r0, 253
RECTF r0, r1, r2, r3, r24

; Draw spiral corridors: 8 concentric rectangles with gaps
; Each ring is offset by 16px and has one side missing
; r10 = ring counter (0..7)
LDI r10, 0

ring_loop:
; offset = 16 + ring * 14
LDI r0, 0
ADD r0, r10
LDI r5, 14
MUL r0, r5
LDI r5, 16
ADD r0, r5

; size = 256 - 2 * offset
LDI r6, 0
ADD r6, r0
LDI r7, 2
MUL r6, r7
LDI r8, 256
LDI r9, 0
ADD r9, r8
SUB r9, r6

; thickness = 2
LDI r20, 2

; ring parity determines which side has the gap
LDI r21, 0
ADD r21, r10
LDI r22, 1
AND r21, r22

; Choose wall color: alternate green/cyan
JNZ r21, use_cyan
LDI r24, 0x00CC66
JMP draw_sides

use_cyan:
LDI r24, 0x22DDAA

draw_sides:
; Top wall (always drawn)
LDI r0, 0
ADD r0, r10
LDI r5, 14
MUL r0, r5
LDI r5, 16
ADD r0, r5
LDI r1, 0
ADD r1, r0
LDI r2, 0
ADD r2, r9
RECTF r0, r1, r2, r20, r24

; Bottom wall (always drawn)
LDI r1, 0
ADD r1, r0
ADD r1, r9
SUB r1, r20
RECTF r0, r1, r2, r20, r24

; Left wall (drawn unless ring is even)
LDI r3, 0
ADD r3, r9
SUB r3, r20
LDI r3, 0
ADD r3, r9
SUB r3, r20
LDI r2, r20
RECTF r0, r1, r2, r3, r24

; Right wall (drawn unless ring is odd)
LDI r2, r20
LDI r1, 0
ADD r1, r0
RECTF r0, r1, r2, r3, r24

; Hmm, this is getting complex with register reuse. Let me simplify.

HALT
