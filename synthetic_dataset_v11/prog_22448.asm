; DESCRIPTION: Creates a green circular shape at (159, 93) with radius 55.
; PLAN: r0=159(x), r1=93(y), r2=55(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 93
LDI r2, 55
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
