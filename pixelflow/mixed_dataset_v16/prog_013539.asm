; DESCRIPTION: Draws a magenta rectangle at (74, 57) with width 38 and height 94.
; PLAN: r0=74(x), r1=57(y), r2=38(width), r3=94(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 57
LDI r2, 38
LDI r3, 94
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
