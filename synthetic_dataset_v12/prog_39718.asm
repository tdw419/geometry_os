; DESCRIPTION: Draws a yellow rectangle at (33, 41) with width 99 and height 117.
; PLAN: r0=33(x), r1=41(y), r2=99(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 41
LDI r2, 99
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
