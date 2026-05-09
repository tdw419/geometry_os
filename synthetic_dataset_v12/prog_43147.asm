; DESCRIPTION: Draws a blue rectangle at (347, 161) with width 53 and height 18.
; PLAN: r0=347(x), r1=161(y), r2=53(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 161
LDI r2, 53
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
