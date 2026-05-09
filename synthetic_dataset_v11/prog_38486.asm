; DESCRIPTION: Draws a white rectangle at (0, 70) with width 89 and height 35.
; PLAN: r0=0(x), r1=70(y), r2=89(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 70
LDI r2, 89
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
