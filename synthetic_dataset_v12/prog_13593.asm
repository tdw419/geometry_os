; DESCRIPTION: Renders a black box of size 37x21 starting at (292, 201).
; PLAN: r0=292(x), r1=201(y), r2=37(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 201
LDI r2, 37
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
