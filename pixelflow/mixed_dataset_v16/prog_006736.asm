; DESCRIPTION: Draws a white rectangle at (29, 70) with width 17 and height 30.
; PLAN: r0=29(x), r1=70(y), r2=17(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 70
LDI r2, 17
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
