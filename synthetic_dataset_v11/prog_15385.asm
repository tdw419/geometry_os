; DESCRIPTION: Draws a magenta rectangle at (99, 137) with width 64 and height 99.
; PLAN: r0=99(x), r1=137(y), r2=64(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 137
LDI r2, 64
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
