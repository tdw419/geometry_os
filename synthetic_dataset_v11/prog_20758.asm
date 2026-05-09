; DESCRIPTION: Draws a magenta rectangle at (144, 178) with width 61 and height 11.
; PLAN: r0=144(x), r1=178(y), r2=61(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 178
LDI r2, 61
LDI r3, 11
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
