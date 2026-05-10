; DESCRIPTION: Renders a orange rectangular region spanning 115 by 41 at (144, 53).
; PLAN: r0=144(x), r1=53(y), r2=115(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 53
LDI r2, 115
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
