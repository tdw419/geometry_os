; DESCRIPTION: Renders a black box of size 43x41 starting at (78, 191).
; PLAN: r0=78(x), r1=191(y), r2=43(width), r3=41(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 191
LDI r2, 43
LDI r3, 41
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
