; DESCRIPTION: Draws a magenta rectangle at (161, 156) with width 46 and height 89.
; PLAN: r0=161(x), r1=156(y), r2=46(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 156
LDI r2, 46
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
