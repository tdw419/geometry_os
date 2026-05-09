; DESCRIPTION: Renders a black box of size 101x110 starting at (83, 80).
; PLAN: r0=83(x), r1=80(y), r2=101(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 80
LDI r2, 101
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
