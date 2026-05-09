; DESCRIPTION: Composite: . Then Renders a red disk with center (190, 106) and radius 38. Then Sets a single purple pixel at (254, 10).
; PLAN: r0=190(x), r1=106(y), r2=38(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=254(x), r1=10(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a red disk with center (190, 106) and radius 38.
; PLAN: r0=190(x), r1=106(y), r2=38(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 190
LDI r1, 106
LDI r2, 38
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single purple pixel at (254, 10).
; PLAN: r0=254(x), r1=10(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 254
LDI r1, 10
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
