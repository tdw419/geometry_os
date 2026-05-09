; DESCRIPTION: Draws a purple rectangle at (33, 6) with width 80 and height 92.
; PLAN: r0=33(x), r1=6(y), r2=80(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 6
LDI r2, 80
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
