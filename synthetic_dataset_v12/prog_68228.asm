; DESCRIPTION: Draws a blue rectangle at (332, 169) with width 79 and height 53.
; PLAN: r0=332(x), r1=169(y), r2=79(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 169
LDI r2, 79
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
