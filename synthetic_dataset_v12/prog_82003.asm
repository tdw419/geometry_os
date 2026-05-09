; DESCRIPTION: Draws a yellow rectangle at (2, 80) with width 41 and height 86.
; PLAN: r0=2(x), r1=80(y), r2=41(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 80
LDI r2, 41
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
