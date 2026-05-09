; DESCRIPTION: Composite: . Then Renders a purple disk with center (162, 170) and radius 33. Then Places a blue dot at position (221, 132).
; PLAN: r0=162(x), r1=170(y), r2=33(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=221(x), r1=132(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a purple disk with center (162, 170) and radius 33.
; PLAN: r0=162(x), r1=170(y), r2=33(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 170
LDI r2, 33
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a blue dot at position (221, 132).
; PLAN: r0=221(x), r1=132(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 221
LDI r1, 132
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
