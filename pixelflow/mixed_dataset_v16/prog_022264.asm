; DESCRIPTION: Draws a magenta rectangle at (76, 85) with width 11 and height 55.
; PLAN: r0=76(x), r1=85(y), r2=11(width), r3=55(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 85
LDI r2, 11
LDI r3, 55
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
