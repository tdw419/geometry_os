; DESCRIPTION: Draws a magenta rectangle at (169, 18) with width 90 and height 19.
; PLAN: r0=169(x), r1=18(y), r2=90(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 18
LDI r2, 90
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
