; DESCRIPTION: Draws a white rectangle at (106, 122) with width 21 and height 54.
; PLAN: r0=106(x), r1=122(y), r2=21(width), r3=54(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 122
LDI r2, 21
LDI r3, 54
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
