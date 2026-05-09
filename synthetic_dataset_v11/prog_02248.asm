; DESCRIPTION: Composite: . Then Sets a single purple pixel at (30, 189). Then Renders a orange disk with center (101, 82) and radius 40.
; PLAN: r0=30(x), r1=189(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=101(x), r1=82(y), r2=40(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single purple pixel at (30, 189).
; PLAN: r0=30(x), r1=189(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 30
LDI r1, 189
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a orange disk with center (101, 82) and radius 40.
; PLAN: r0=101(x), r1=82(y), r2=40(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 82
LDI r2, 40
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
