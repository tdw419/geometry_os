; DESCRIPTION: Composite: . Then Places a cyan dot at position (124, 110). Then Renders a purple disk with center (136, 105) and radius 28.
; PLAN: r0=124(x), r1=110(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=136(x), r1=105(y), r2=28(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a cyan dot at position (124, 110).
; PLAN: r0=124(x), r1=110(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 124
LDI r1, 110
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a purple disk with center (136, 105) and radius 28.
; PLAN: r0=136(x), r1=105(y), r2=28(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 105
LDI r2, 28
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
