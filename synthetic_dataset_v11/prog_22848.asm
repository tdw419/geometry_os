; DESCRIPTION: Composite: . Then Sets a single orange pixel at (255, 21). Then Renders a blue disk with center (51, 80) and radius 38.
; PLAN: r0=255(x), r1=21(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=51(x), r1=80(y), r2=38(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single orange pixel at (255, 21).
; PLAN: r0=255(x), r1=21(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 255
LDI r1, 21
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Renders a blue disk with center (51, 80) and radius 38.
; PLAN: r0=51(x), r1=80(y), r2=38(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 51
LDI r1, 80
LDI r2, 38
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
