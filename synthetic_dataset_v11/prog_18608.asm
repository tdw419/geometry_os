; DESCRIPTION: Composite: . Then Renders a green disk with center (60, 189) and radius 45. Then Sets a single magenta pixel at (118, 23).
; PLAN: r0=60(x), r1=189(y), r2=45(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=118(x), r1=23(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a green disk with center (60, 189) and radius 45.
; PLAN: r0=60(x), r1=189(y), r2=45(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 60
LDI r1, 189
LDI r2, 45
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single magenta pixel at (118, 23).
; PLAN: r0=118(x), r1=23(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 118
LDI r1, 23
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
