; DESCRIPTION: Renders a black box of size 53x41 starting at (76, 54).
; PLAN: r0=76(x), r1=54(y), r2=53(width), r3=41(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 54
LDI r2, 53
LDI r3, 41
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
