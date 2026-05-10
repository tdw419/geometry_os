; DESCRIPTION: Renders a orange rectangular region spanning 41 by 32 at (41, 123).
; PLAN: r0=41(x), r1=123(y), r2=41(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 123
LDI r2, 41
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
