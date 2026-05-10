; DESCRIPTION: Draws a magenta rectangle at (19, 125) with width 94 and height 47.
; PLAN: r0=19(x), r1=125(y), r2=94(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 125
LDI r2, 94
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
