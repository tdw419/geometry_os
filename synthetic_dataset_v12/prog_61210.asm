; DESCRIPTION: Creates a blue circular shape at (189, 50) with radius 17.
; PLAN: r0=189(x), r1=50(y), r2=17(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 189
LDI r1, 50
LDI r2, 17
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
