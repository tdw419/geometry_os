; DESCRIPTION: Draws a magenta rectangle at (175, 102) with width 55 and height 68.
; PLAN: r0=175(x), r1=102(y), r2=55(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 102
LDI r2, 55
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
