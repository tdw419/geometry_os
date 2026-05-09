; DESCRIPTION: Draws a green rectangle at (254, 9) with width 11 and height 53.
; PLAN: r0=254(x), r1=9(y), r2=11(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 9
LDI r2, 11
LDI r3, 53
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
