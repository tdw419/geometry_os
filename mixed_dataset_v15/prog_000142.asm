; DESCRIPTION: Renders a black box of size 119x101 starting at (323, 18).
; PLAN: r0=323(x), r1=18(y), r2=119(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 18
LDI r2, 119
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
