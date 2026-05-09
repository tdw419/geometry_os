; DESCRIPTION: Draws a magenta rectangle at (128, 99) with width 97 and height 34.
; PLAN: r0=128(x), r1=99(y), r2=97(width), r3=34(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 99
LDI r2, 97
LDI r3, 34
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
