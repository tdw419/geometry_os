; DESCRIPTION: Renders a yellow box of size 41x81 starting at (258, 36).
; PLAN: r0=258(x), r1=36(y), r2=41(width), r3=81(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 36
LDI r2, 41
LDI r3, 81
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
