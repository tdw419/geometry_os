; DESCRIPTION: Draws a blue rectangle at (52, 39) with width 34 and height 119.
; PLAN: r0=52(x), r1=39(y), r2=34(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 39
LDI r2, 34
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
