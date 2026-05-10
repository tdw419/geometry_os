; DESCRIPTION: Renders a white rectangular region spanning 97 by 21 at (41, 104).
; PLAN: r0=41(x), r1=104(y), r2=97(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 104
LDI r2, 97
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
