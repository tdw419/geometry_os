; DESCRIPTION: Draws a yellow rectangle at (202, 6) with width 41 and height 102.
; PLAN: r0=202(x), r1=6(y), r2=41(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 6
LDI r2, 41
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
