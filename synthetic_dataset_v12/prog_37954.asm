; DESCRIPTION: Creates a green circular shape at (260, 140) with radius 64.
; PLAN: r0=260(x), r1=140(y), r2=64(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 260
LDI r1, 140
LDI r2, 64
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
