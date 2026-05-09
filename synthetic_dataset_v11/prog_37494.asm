; DESCRIPTION: Composite: . Then Sets a single purple pixel at (20, 128). Then Renders a orange disk with center (139, 170) and radius 20.
; PLAN: r0=20(x), r1=128(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=139(x), r1=170(y), r2=20(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single purple pixel at (20, 128).
; PLAN: r0=20(x), r1=128(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 20
LDI r1, 128
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a orange disk with center (139, 170) and radius 20.
; PLAN: r0=139(x), r1=170(y), r2=20(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 139
LDI r1, 170
LDI r2, 20
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
