; DESCRIPTION: Renders a yellow rectangular region spanning 41 by 78 at (327, 155).
; PLAN: r0=327(x), r1=155(y), r2=41(width), r3=78(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 155
LDI r2, 41
LDI r3, 78
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
