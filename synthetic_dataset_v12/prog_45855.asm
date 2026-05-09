; DESCRIPTION: Draws a magenta rectangle at (19, 218) with width 74 and height 15.
; PLAN: r0=19(x), r1=218(y), r2=74(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 218
LDI r2, 74
LDI r3, 15
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
