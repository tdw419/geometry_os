; DESCRIPTION: Creates a green circular shape at (172, 199) with radius 32.
; PLAN: r0=172(x), r1=199(y), r2=32(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 199
LDI r2, 32
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
