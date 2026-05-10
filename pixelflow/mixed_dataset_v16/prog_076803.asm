; DESCRIPTION: Draws a magenta rectangle at (283, 114) with width 95 and height 33.
; PLAN: r0=283(x), r1=114(y), r2=95(width), r3=33(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 114
LDI r2, 95
LDI r3, 33
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
