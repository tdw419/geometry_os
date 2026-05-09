; DESCRIPTION: Draws a blue rectangle at (112, 18) with width 96 and height 28.
; PLAN: r0=112(x), r1=18(y), r2=96(width), r3=28(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 18
LDI r2, 96
LDI r3, 28
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
