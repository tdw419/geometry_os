; DESCRIPTION: Draws a purple rectangle at (411, 152) with width 89 and height 96.
; PLAN: r0=411(x), r1=152(y), r2=89(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 152
LDI r2, 89
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
