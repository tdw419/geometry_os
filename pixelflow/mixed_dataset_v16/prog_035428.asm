; DESCRIPTION: Draws a blue rectangle at (310, 20) with width 83 and height 105.
; PLAN: r0=310(x), r1=20(y), r2=83(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 20
LDI r2, 83
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
