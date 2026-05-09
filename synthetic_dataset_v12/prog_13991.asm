; DESCRIPTION: Renders a black box of size 31x35 starting at (376, 119).
; PLAN: r0=376(x), r1=119(y), r2=31(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 119
LDI r2, 31
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
