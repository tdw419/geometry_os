; DESCRIPTION: Draws a magenta rectangle at (20, 115) with width 102 and height 65.
; PLAN: r0=20(x), r1=115(y), r2=102(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 115
LDI r2, 102
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
