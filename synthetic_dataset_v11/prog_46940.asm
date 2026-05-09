; DESCRIPTION: Composite: . Then Places a blue circle of radius 30 at center (31, 124). Then Places a black dot at position (189, 147).
; PLAN: r0=31(x), r1=124(y), r2=30(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=189(x), r1=147(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a blue circle of radius 30 at center (31, 124).
; PLAN: r0=31(x), r1=124(y), r2=30(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 31
LDI r1, 124
LDI r2, 30
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a black dot at position (189, 147).
; PLAN: r0=189(x), r1=147(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 189
LDI r1, 147
LDI r2, 0x000000
PSET r0, r1, r2
HALT
