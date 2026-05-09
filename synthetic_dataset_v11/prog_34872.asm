; DESCRIPTION: Composite: . Then Sets a single purple pixel at (144, 130). Then Renders a cyan disk with center (64, 227) and radius 23.
; PLAN: r0=144(x), r1=130(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=64(x), r1=227(y), r2=23(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single purple pixel at (144, 130).
; PLAN: r0=144(x), r1=130(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 144
LDI r1, 130
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a cyan disk with center (64, 227) and radius 23.
; PLAN: r0=64(x), r1=227(y), r2=23(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 64
LDI r1, 227
LDI r2, 23
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
