; DESCRIPTION: Draws a yellow rectangle at (380, 10) with width 41 and height 12.
; PLAN: r0=380(x), r1=10(y), r2=41(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 10
LDI r2, 41
LDI r3, 12
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
