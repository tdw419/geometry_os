; DESCRIPTION: Composite: . Then Places a blue dot at position (150, 110). Then Renders a black disk with center (80, 185) and radius 29.
; PLAN: r0=150(x), r1=110(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=80(x), r1=185(y), r2=29(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a blue dot at position (150, 110).
; PLAN: r0=150(x), r1=110(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 150
LDI r1, 110
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Renders a black disk with center (80, 185) and radius 29.
; PLAN: r0=80(x), r1=185(y), r2=29(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 80
LDI r1, 185
LDI r2, 29
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
