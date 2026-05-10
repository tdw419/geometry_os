; DESCRIPTION: Draws a magenta rectangle at (269, 101) with width 97 and height 27.
; PLAN: r0=269(x), r1=101(y), r2=97(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 101
LDI r2, 97
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
