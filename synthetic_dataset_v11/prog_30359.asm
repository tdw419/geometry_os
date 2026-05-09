; DESCRIPTION: Renders a purple box of size 41x95 starting at (161, 114).
; PLAN: r0=161(x), r1=114(y), r2=41(width), r3=95(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 114
LDI r2, 41
LDI r3, 95
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
