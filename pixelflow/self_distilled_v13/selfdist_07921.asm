; DESCRIPTION: Draws a white rectangle at (364, 155) with width 54 and height 35.
; PLAN: r0=364(x), r1=155(y), r2=54(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 155
LDI r2, 54
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
