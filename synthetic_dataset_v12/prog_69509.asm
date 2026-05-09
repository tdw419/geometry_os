; DESCRIPTION: Draws a purple rectangle at (254, 54) with width 10 and height 91.
; PLAN: r0=254(x), r1=54(y), r2=10(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 54
LDI r2, 10
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
