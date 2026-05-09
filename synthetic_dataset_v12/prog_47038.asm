; DESCRIPTION: Renders a black box of size 11x109 starting at (483, 35).
; PLAN: r0=483(x), r1=35(y), r2=11(width), r3=109(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 35
LDI r2, 11
LDI r3, 109
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
