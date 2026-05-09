; DESCRIPTION: Draws a yellow rectangle at (4, 82) with width 41 and height 41.
; PLAN: r0=4(x), r1=82(y), r2=41(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 82
LDI r2, 41
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
