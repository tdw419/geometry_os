; DESCRIPTION: Renders a white rectangular region spanning 12 by 55 at (204, 41).
; PLAN: r0=204(x), r1=41(y), r2=12(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 41
LDI r2, 12
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
