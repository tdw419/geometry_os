; DESCRIPTION: Draws a magenta rectangle at (337, 123) with width 45 and height 47.
; PLAN: r0=337(x), r1=123(y), r2=45(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 123
LDI r2, 45
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
