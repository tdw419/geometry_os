; DESCRIPTION: Renders a yellow box of size 89x79 starting at (216, 41).
; PLAN: r0=216(x), r1=41(y), r2=89(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 41
LDI r2, 89
LDI r3, 79
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
