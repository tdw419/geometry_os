; DESCRIPTION: Renders a black box of size 60x119 starting at (323, 69).
; PLAN: r0=323(x), r1=69(y), r2=60(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 69
LDI r2, 60
LDI r3, 119
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
