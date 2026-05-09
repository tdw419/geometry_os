; DESCRIPTION: Draws a yellow rectangle at (289, 94) with width 66 and height 10.
; PLAN: r0=289(x), r1=94(y), r2=66(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 94
LDI r2, 66
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
