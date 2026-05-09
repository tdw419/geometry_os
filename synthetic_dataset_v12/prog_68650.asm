; DESCRIPTION: Draws a blue rectangle at (111, 65) with width 51 and height 66.
; PLAN: r0=111(x), r1=65(y), r2=51(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 65
LDI r2, 51
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
