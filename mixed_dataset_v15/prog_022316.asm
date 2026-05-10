; DESCRIPTION: Draws a white rectangle at (254, 49) with width 85 and height 21.
; PLAN: r0=254(x), r1=49(y), r2=85(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 49
LDI r2, 85
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
