; DESCRIPTION: Composite: . Then Places a red dot at position (245, 246). Then Renders a yellow disk with center (200, 51) and radius 45.
; PLAN: r0=245(x), r1=246(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=200(x), r1=51(y), r2=45(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a red dot at position (245, 246).
; PLAN: r0=245(x), r1=246(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 245
LDI r1, 246
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Renders a yellow disk with center (200, 51) and radius 45.
; PLAN: r0=200(x), r1=51(y), r2=45(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 200
LDI r1, 51
LDI r2, 45
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
