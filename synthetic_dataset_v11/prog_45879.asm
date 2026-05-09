; DESCRIPTION: Composite: . Then Places a blue dot at position (98, 133). Then Draws a black circle centered at (58, 51) with radius 17.
; PLAN: r0=98(x), r1=133(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=58(x), r1=51(y), r2=17(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a blue dot at position (98, 133).
; PLAN: r0=98(x), r1=133(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 98
LDI r1, 133
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Draws a black circle centered at (58, 51) with radius 17.
; PLAN: r0=58(x), r1=51(y), r2=17(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 58
LDI r1, 51
LDI r2, 17
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
