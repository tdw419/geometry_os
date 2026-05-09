; DESCRIPTION: Draws a yellow rectangle at (352, 23) with width 83 and height 41.
; PLAN: r0=352(x), r1=23(y), r2=83(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 23
LDI r2, 83
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
