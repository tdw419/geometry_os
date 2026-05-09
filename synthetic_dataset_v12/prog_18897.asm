; DESCRIPTION: Draws a blue rectangle at (240, 66) with width 90 and height 52.
; PLAN: r0=240(x), r1=66(y), r2=90(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 66
LDI r2, 90
LDI r3, 52
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
