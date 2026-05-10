; DESCRIPTION: Renders a black box of size 21x62 starting at (378, 41).
; PLAN: r0=378(x), r1=41(y), r2=21(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 41
LDI r2, 21
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
