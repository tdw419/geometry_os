; DESCRIPTION: Renders a white box of size 41x78 starting at (253, 38).
; PLAN: r0=253(x), r1=38(y), r2=41(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 38
LDI r2, 41
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
