; DESCRIPTION: Composite: . Then Sets a single red pixel at (245, 159). Then Renders a blue disk with center (72, 89) and radius 65.
; PLAN: r0=245(x), r1=159(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=72(x), r1=89(y), r2=65(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single red pixel at (245, 159).
; PLAN: r0=245(x), r1=159(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 245
LDI r1, 159
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Renders a blue disk with center (72, 89) and radius 65.
; PLAN: r0=72(x), r1=89(y), r2=65(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 89
LDI r2, 65
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
