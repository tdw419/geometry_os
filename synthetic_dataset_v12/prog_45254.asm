; DESCRIPTION: Creates a green circular shape at (87, 134) with radius 53.
; PLAN: r0=87(x), r1=134(y), r2=53(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 134
LDI r2, 53
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
