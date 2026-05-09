; DESCRIPTION: Composite: . Then Places a black dot at position (51, 129). Then Places a cyan circle of radius 26 at center (220, 51).
; PLAN: r0=51(x), r1=129(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=220(x), r1=51(y), r2=26(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a black dot at position (51, 129).
; PLAN: r0=51(x), r1=129(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 51
LDI r1, 129
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Places a cyan circle of radius 26 at center (220, 51).
; PLAN: r0=220(x), r1=51(y), r2=26(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 220
LDI r1, 51
LDI r2, 26
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
