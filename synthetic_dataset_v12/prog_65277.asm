; DESCRIPTION: Renders a yellow box of size 60x41 starting at (140, 126).
; PLAN: r0=140(x), r1=126(y), r2=60(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 126
LDI r2, 60
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
