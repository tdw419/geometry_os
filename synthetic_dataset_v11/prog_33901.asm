; DESCRIPTION: Composite: . Then Sets a single blue pixel at (168, 236). Then Renders a purple disk with center (196, 78) and radius 11.
; PLAN: r0=168(x), r1=236(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=196(x), r1=78(y), r2=11(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single blue pixel at (168, 236).
; PLAN: r0=168(x), r1=236(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 168
LDI r1, 236
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Renders a purple disk with center (196, 78) and radius 11.
; PLAN: r0=196(x), r1=78(y), r2=11(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 196
LDI r1, 78
LDI r2, 11
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
