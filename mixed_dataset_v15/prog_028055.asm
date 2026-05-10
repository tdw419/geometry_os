; DESCRIPTION: Draws a white rectangle at (254, 114) with width 115 and height 10.
; PLAN: r0=254(x), r1=114(y), r2=115(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 114
LDI r2, 115
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
