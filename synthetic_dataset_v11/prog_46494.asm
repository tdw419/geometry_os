; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (101, 105). Then Renders a white disk with center (158, 66) and radius 27.
; PLAN: r0=101(x), r1=105(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=158(x), r1=66(y), r2=27(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single yellow pixel at (101, 105).
; PLAN: r0=101(x), r1=105(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 101
LDI r1, 105
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Renders a white disk with center (158, 66) and radius 27.
; PLAN: r0=158(x), r1=66(y), r2=27(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 66
LDI r2, 27
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
