; DESCRIPTION: Draws a blue rectangle at (315, 162) with width 71 and height 36.
; PLAN: r0=315(x), r1=162(y), r2=71(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 162
LDI r2, 71
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
