; DESCRIPTION: Creates a white circular shape at (195, 99) with radius 63.
; PLAN: r0=195(x), r1=99(y), r2=63(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 99
LDI r2, 63
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
