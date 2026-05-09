; DESCRIPTION: Renders a black box of size 77x110 starting at (221, 140).
; PLAN: r0=221(x), r1=140(y), r2=77(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 140
LDI r2, 77
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
