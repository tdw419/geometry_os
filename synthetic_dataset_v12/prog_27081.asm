; DESCRIPTION: Draws a blue rectangle at (338, 117) with width 105 and height 76.
; PLAN: r0=338(x), r1=117(y), r2=105(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 117
LDI r2, 105
LDI r3, 76
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
