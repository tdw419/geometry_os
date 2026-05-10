; DESCRIPTION: Draws a blue rectangle at (347, 174) with width 72 and height 35.
; PLAN: r0=347(x), r1=174(y), r2=72(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 174
LDI r2, 72
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
