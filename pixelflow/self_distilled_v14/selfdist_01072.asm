; DESCRIPTION: Renders a yellow rectangular region spanning 15 by 41 at (96, 10).
; PLAN: r0=96(x), r1=10(y), r2=15(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 10
LDI r2, 15
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
