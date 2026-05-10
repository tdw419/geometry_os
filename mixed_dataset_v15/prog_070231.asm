; DESCRIPTION: Draws a blue rectangle at (125, 8) with width 33 and height 49.
; PLAN: r0=125(x), r1=8(y), r2=33(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 8
LDI r2, 33
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
