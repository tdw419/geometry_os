; DESCRIPTION: Renders a yellow box of size 91x41 starting at (216, 63).
; PLAN: r0=216(x), r1=63(y), r2=91(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 63
LDI r2, 91
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
