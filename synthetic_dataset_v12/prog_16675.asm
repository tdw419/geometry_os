; DESCRIPTION: Composite: Places a purple 52x84 rectangle at position (68, 97) then Draws a black circle centered at (288, 100) with radius 63.
; PLAN: r0=68(x), r1=97(y), r2=52(width), r3=84(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=288(x), r6=100(y), r7=63(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 68
LDI r1, 97
LDI r2, 52
LDI r3, 84
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 288
LDI r6, 100
LDI r7, 63
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
