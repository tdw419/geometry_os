; DESCRIPTION: Draws a magenta rectangle at (107, 17) with width 80 and height 45.
; PLAN: r0=107(x), r1=17(y), r2=80(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 17
LDI r2, 80
LDI r3, 45
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
