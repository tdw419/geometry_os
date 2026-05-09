; DESCRIPTION: Composite: . Then Creates a yellow circular shape at (73, 163) with radius 21. Then Places a white dot at position (8, 45).
; PLAN: r0=73(x), r1=163(y), r2=21(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=8(x), r1=45(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a yellow circular shape at (73, 163) with radius 21.
; PLAN: r0=73(x), r1=163(y), r2=21(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 73
LDI r1, 163
LDI r2, 21
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a white dot at position (8, 45).
; PLAN: r0=8(x), r1=45(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 8
LDI r1, 45
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
