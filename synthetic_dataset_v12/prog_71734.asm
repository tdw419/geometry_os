; DESCRIPTION: Draws a black rectangle at (402, 18) with width 38 and height 71.
; PLAN: r0=402(x), r1=18(y), r2=38(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 18
LDI r2, 38
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
