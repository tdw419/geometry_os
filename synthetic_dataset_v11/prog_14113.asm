; DESCRIPTION: Composite: . Then Places a black dot at position (191, 71). Then Places a green circle of radius 14 at center (55, 224).
; PLAN: r0=191(x), r1=71(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=55(x), r1=224(y), r2=14(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a black dot at position (191, 71).
; PLAN: r0=191(x), r1=71(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 191
LDI r1, 71
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Places a green circle of radius 14 at center (55, 224).
; PLAN: r0=55(x), r1=224(y), r2=14(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 55
LDI r1, 224
LDI r2, 14
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
