; DESCRIPTION: Draws a blue rectangle at (2, 55) with width 34 and height 107.
; PLAN: r0=2(x), r1=55(y), r2=34(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 55
LDI r2, 34
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
