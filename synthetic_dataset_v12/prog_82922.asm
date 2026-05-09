; DESCRIPTION: Renders a yellow box of size 115x13 starting at (41, 185).
; PLAN: r0=41(x), r1=185(y), r2=115(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 185
LDI r2, 115
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
