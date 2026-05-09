; DESCRIPTION: Draws a magenta rectangle at (169, 53) with width 31 and height 99.
; PLAN: r0=169(x), r1=53(y), r2=31(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 53
LDI r2, 31
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
