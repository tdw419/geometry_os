; DESCRIPTION: Draws a magenta rectangle at (100, 192) with width 72 and height 55.
; PLAN: r0=100(x), r1=192(y), r2=72(width), r3=55(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 192
LDI r2, 72
LDI r3, 55
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
