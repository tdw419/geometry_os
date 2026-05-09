; DESCRIPTION: Renders a green box of size 10x41 starting at (93, 165).
; PLAN: r0=93(x), r1=165(y), r2=10(width), r3=41(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 165
LDI r2, 10
LDI r3, 41
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
