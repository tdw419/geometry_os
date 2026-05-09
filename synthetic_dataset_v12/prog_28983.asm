; DESCRIPTION: Creates a green circular shape at (345, 152) with radius 52.
; PLAN: r0=345(x), r1=152(y), r2=52(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 345
LDI r1, 152
LDI r2, 52
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
