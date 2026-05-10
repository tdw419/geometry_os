; DESCRIPTION: Draws a white rectangle at (347, 60) with width 88 and height 70.
; PLAN: r0=347(x), r1=60(y), r2=88(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 60
LDI r2, 88
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
