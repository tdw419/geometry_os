; DESCRIPTION: Draws a yellow rectangle at (291, 119) with width 28 and height 13.
; PLAN: r0=291(x), r1=119(y), r2=28(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 119
LDI r2, 28
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
