; DESCRIPTION: Draws a magenta rectangle at (44, 60) with width 94 and height 74.
; PLAN: r0=44(x), r1=60(y), r2=94(width), r3=74(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 60
LDI r2, 94
LDI r3, 74
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
