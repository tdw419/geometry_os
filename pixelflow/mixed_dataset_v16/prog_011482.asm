; DESCRIPTION: Draws a magenta rectangle at (370, 20) with width 11 and height 39.
; PLAN: r0=370(x), r1=20(y), r2=11(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 20
LDI r2, 11
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
