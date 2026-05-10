; DESCRIPTION: Renders a orange rectangular region spanning 93 by 41 at (72, 194).
; PLAN: r0=72(x), r1=194(y), r2=93(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 194
LDI r2, 93
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
