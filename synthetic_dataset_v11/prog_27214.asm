; DESCRIPTION: Composite: . Then Renders a blue disk with center (186, 199) and radius 20. Then Places a purple dot at position (243, 140).
; PLAN: r0=186(x), r1=199(y), r2=20(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=243(x), r1=140(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a blue disk with center (186, 199) and radius 20.
; PLAN: r0=186(x), r1=199(y), r2=20(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 199
LDI r2, 20
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a purple dot at position (243, 140).
; PLAN: r0=243(x), r1=140(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 243
LDI r1, 140
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
