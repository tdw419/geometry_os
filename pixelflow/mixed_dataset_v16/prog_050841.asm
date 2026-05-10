; DESCRIPTION: Renders a yellow box of size 41x106 starting at (291, 126).
; PLAN: r0=291(x), r1=126(y), r2=41(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 126
LDI r2, 41
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
