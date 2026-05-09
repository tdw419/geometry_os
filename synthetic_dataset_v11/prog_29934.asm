; DESCRIPTION: Renders a black box of size 20x98 starting at (201, 96).
; PLAN: r0=201(x), r1=96(y), r2=20(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 96
LDI r2, 20
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
