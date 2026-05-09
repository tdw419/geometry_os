; DESCRIPTION: Renders a green box of size 58x41 starting at (109, 179).
; PLAN: r0=109(x), r1=179(y), r2=58(width), r3=41(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 179
LDI r2, 58
LDI r3, 41
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
