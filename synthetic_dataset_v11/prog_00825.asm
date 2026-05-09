; DESCRIPTION: Draws a magenta rectangle at (72, 122) with width 55 and height 46.
; PLAN: r0=72(x), r1=122(y), r2=55(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 122
LDI r2, 55
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
