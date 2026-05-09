; DESCRIPTION: Draws a magenta rectangle at (396, 25) with width 18 and height 115.
; PLAN: r0=396(x), r1=25(y), r2=18(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 25
LDI r2, 18
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
