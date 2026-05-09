; DESCRIPTION: Draws a blue rectangle at (106, 34) with width 47 and height 119.
; PLAN: r0=106(x), r1=34(y), r2=47(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 34
LDI r2, 47
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
