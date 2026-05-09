; DESCRIPTION: Renders a yellow box of size 97x23 starting at (147, 41).
; PLAN: r0=147(x), r1=41(y), r2=97(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 41
LDI r2, 97
LDI r3, 23
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
