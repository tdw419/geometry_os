; DESCRIPTION: Draws a yellow rectangle at (46, 41) with width 100 and height 96.
; PLAN: r0=46(x), r1=41(y), r2=100(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 41
LDI r2, 100
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
