; DESCRIPTION: Draws a black rectangle at (209, 110) with width 19 and height 86.
; PLAN: r0=209(x), r1=110(y), r2=19(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 110
LDI r2, 19
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
