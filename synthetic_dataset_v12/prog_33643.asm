; DESCRIPTION: Draws a green rectangle at (112, 123) with width 19 and height 28.
; PLAN: r0=112(x), r1=123(y), r2=19(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 123
LDI r2, 19
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
