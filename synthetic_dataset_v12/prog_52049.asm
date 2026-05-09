; DESCRIPTION: Draws a blue rectangle at (22, 96) with width 71 and height 99.
; PLAN: r0=22(x), r1=96(y), r2=71(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 96
LDI r2, 71
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
