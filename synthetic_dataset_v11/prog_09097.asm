; DESCRIPTION: Draws a blue rectangle at (112, 14) with width 71 and height 79.
; PLAN: r0=112(x), r1=14(y), r2=71(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 14
LDI r2, 71
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
