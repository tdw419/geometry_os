; DESCRIPTION: Draws a magenta rectangle at (201, 194) with width 19 and height 53.
; PLAN: r0=201(x), r1=194(y), r2=19(width), r3=53(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 194
LDI r2, 19
LDI r3, 53
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
