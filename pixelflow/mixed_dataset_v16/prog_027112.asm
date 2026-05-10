; DESCRIPTION: Draws a black rectangle at (430, 54) with width 65 and height 53.
; PLAN: r0=430(x), r1=54(y), r2=65(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 54
LDI r2, 65
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
