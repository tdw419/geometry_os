; DESCRIPTION: Draws a magenta rectangle at (19, 151) with width 26 and height 75.
; PLAN: r0=19(x), r1=151(y), r2=26(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 151
LDI r2, 26
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
