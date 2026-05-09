; DESCRIPTION: Draws a blue rectangle at (115, 28) with width 84 and height 11.
; PLAN: r0=115(x), r1=28(y), r2=84(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 28
LDI r2, 84
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
