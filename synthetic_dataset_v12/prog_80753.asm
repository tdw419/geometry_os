; DESCRIPTION: Draws a white rectangle at (472, 144) with width 33 and height 18.
; PLAN: r0=472(x), r1=144(y), r2=33(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 144
LDI r2, 33
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
