; DESCRIPTION: Renders a purple box of size 91x41 starting at (93, 50).
; PLAN: r0=93(x), r1=50(y), r2=91(width), r3=41(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 50
LDI r2, 91
LDI r3, 41
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
