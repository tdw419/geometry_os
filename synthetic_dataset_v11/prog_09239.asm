; DESCRIPTION: Composite: . Then Places a blue dot at position (161, 86). Then Draws a purple circle centered at (195, 51) with radius 30.
; PLAN: r0=161(x), r1=86(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=195(x), r1=51(y), r2=30(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a blue dot at position (161, 86).
; PLAN: r0=161(x), r1=86(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 161
LDI r1, 86
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Draws a purple circle centered at (195, 51) with radius 30.
; PLAN: r0=195(x), r1=51(y), r2=30(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 51
LDI r2, 30
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
