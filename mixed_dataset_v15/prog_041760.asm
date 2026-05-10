; DESCRIPTION: Draws a black rectangle at (91, 52) with width 94 and height 33.
; PLAN: r0=91(x), r1=52(y), r2=94(width), r3=33(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 52
LDI r2, 94
LDI r3, 33
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
