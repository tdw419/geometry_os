; DESCRIPTION: Composite: . Then Renders a red disk with center (181, 181) and radius 51. Then Places a purple dot at position (32, 84).
; PLAN: r0=181(x), r1=181(y), r2=51(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=32(x), r1=84(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a red disk with center (181, 181) and radius 51.
; PLAN: r0=181(x), r1=181(y), r2=51(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 181
LDI r1, 181
LDI r2, 51
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a purple dot at position (32, 84).
; PLAN: r0=32(x), r1=84(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 32
LDI r1, 84
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
