; DESCRIPTION: Renders a white rectangular region spanning 70 by 41 at (58, 85).
; PLAN: r0=58(x), r1=85(y), r2=70(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 85
LDI r2, 70
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
