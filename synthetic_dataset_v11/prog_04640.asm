; DESCRIPTION: Composite: . Then Places a black circle of radius 73 at center (152, 112). Then Sets a single green pixel at (211, 156).
; PLAN: r0=152(x), r1=112(y), r2=73(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=211(x), r1=156(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a black circle of radius 73 at center (152, 112).
; PLAN: r0=152(x), r1=112(y), r2=73(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 152
LDI r1, 112
LDI r2, 73
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single green pixel at (211, 156).
; PLAN: r0=211(x), r1=156(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 211
LDI r1, 156
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
