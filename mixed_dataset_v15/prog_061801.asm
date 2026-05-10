; DESCRIPTION: Renders a orange rectangular region spanning 29 by 51 at (22, 41).
; PLAN: r0=22(x), r1=41(y), r2=29(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 41
LDI r2, 29
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
