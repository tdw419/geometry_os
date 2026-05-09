; DESCRIPTION: Draws a magenta rectangle at (301, 94) with width 34 and height 107.
; PLAN: r0=301(x), r1=94(y), r2=34(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 94
LDI r2, 34
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
