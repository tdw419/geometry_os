; DESCRIPTION: Creates a green circular shape at (330, 189) with radius 21.
; PLAN: r0=330(x), r1=189(y), r2=21(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 330
LDI r1, 189
LDI r2, 21
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
