; DESCRIPTION: Creates a green circular shape at (62, 82) with radius 62.
; PLAN: r0=62(x), r1=82(y), r2=62(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 62
LDI r1, 82
LDI r2, 62
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
