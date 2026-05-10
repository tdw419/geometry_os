; DESCRIPTION: Renders a red rectangular region spanning 41 by 107 at (364, 165).
; PLAN: r0=364(x), r1=165(y), r2=41(width), r3=107(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 165
LDI r2, 41
LDI r3, 107
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
