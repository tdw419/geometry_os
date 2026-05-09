; DESCRIPTION: Creates a green circular shape at (189, 198) with radius 50.
; PLAN: r0=189(x), r1=198(y), r2=50(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 189
LDI r1, 198
LDI r2, 50
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
