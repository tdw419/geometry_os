; DESCRIPTION: Draws a magenta rectangle at (291, 46) with width 26 and height 55.
; PLAN: r0=291(x), r1=46(y), r2=26(width), r3=55(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 46
LDI r2, 26
LDI r3, 55
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
