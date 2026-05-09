; DESCRIPTION: Draws a green rectangle at (432, 133) with width 10 and height 92.
; PLAN: r0=432(x), r1=133(y), r2=10(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 133
LDI r2, 10
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
