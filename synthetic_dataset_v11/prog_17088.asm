; DESCRIPTION: Composite: . Then Places a cyan circle of radius 58 at center (119, 80). Then Places a black dot at position (92, 11).
; PLAN: r0=119(x), r1=80(y), r2=58(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=92(x), r1=11(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a cyan circle of radius 58 at center (119, 80).
; PLAN: r0=119(x), r1=80(y), r2=58(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 80
LDI r2, 58
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a black dot at position (92, 11).
; PLAN: r0=92(x), r1=11(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 92
LDI r1, 11
LDI r2, 0x000000
PSET r0, r1, r2
HALT
