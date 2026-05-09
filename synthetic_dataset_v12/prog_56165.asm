; DESCRIPTION: Creates a green circular shape at (87, 58) with radius 32.
; PLAN: r0=87(x), r1=58(y), r2=32(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 58
LDI r2, 32
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
