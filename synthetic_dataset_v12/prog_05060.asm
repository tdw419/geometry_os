; DESCRIPTION: Draws a blue rectangle at (125, 77) with width 108 and height 35.
; PLAN: r0=125(x), r1=77(y), r2=108(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 77
LDI r2, 108
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
