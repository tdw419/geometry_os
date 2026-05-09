; DESCRIPTION: Composite: . Then Sets a single red pixel at (212, 88). Then Renders a blue disk with center (143, 94) and radius 34.
; PLAN: r0=212(x), r1=88(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=143(x), r1=94(y), r2=34(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single red pixel at (212, 88).
; PLAN: r0=212(x), r1=88(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 212
LDI r1, 88
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Renders a blue disk with center (143, 94) and radius 34.
; PLAN: r0=143(x), r1=94(y), r2=34(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 143
LDI r1, 94
LDI r2, 34
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
