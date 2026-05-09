; DESCRIPTION: Draws a yellow rectangle at (130, 119) with width 89 and height 70.
; PLAN: r0=130(x), r1=119(y), r2=89(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 119
LDI r2, 89
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
