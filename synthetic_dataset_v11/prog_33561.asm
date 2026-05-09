; DESCRIPTION: Composite: . Then Renders a black disk with center (83, 70) and radius 36. Then Places a cyan dot at position (109, 1).
; PLAN: r0=83(x), r1=70(y), r2=36(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=109(x), r1=1(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a black disk with center (83, 70) and radius 36.
; PLAN: r0=83(x), r1=70(y), r2=36(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 70
LDI r2, 36
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a cyan dot at position (109, 1).
; PLAN: r0=109(x), r1=1(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 109
LDI r1, 1
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
