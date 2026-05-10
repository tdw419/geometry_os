; DESCRIPTION: Creates a green circular shape at (285, 82) with radius 14.
; PLAN: r0=285(x), r1=82(y), r2=14(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 285
LDI r1, 82
LDI r2, 14
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
