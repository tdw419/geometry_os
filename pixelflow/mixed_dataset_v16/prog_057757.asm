; DESCRIPTION: Draws a purple rectangle at (20, 152) with width 92 and height 55.
; PLAN: r0=20(x), r1=152(y), r2=92(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 152
LDI r2, 92
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
