; DESCRIPTION: Draws a white rectangle at (62, 200) with width 44 and height 54.
; PLAN: r0=62(x), r1=200(y), r2=44(width), r3=54(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 200
LDI r2, 44
LDI r3, 54
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
