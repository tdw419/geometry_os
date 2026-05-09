; DESCRIPTION: Creates a yellow circular shape at (130, 179) with radius 30.
; PLAN: r0=130(x), r1=179(y), r2=30(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 179
LDI r2, 30
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
