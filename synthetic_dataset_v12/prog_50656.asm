; DESCRIPTION: Draws a black rectangle at (395, 227) with width 54 and height 10.
; PLAN: r0=395(x), r1=227(y), r2=54(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 227
LDI r2, 54
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
