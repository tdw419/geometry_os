; DESCRIPTION: Composite: . Then Places a orange circle of radius 52 at center (121, 112). Then Places a blue dot at position (185, 35).
; PLAN: r0=121(x), r1=112(y), r2=52(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=185(x), r1=35(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a orange circle of radius 52 at center (121, 112).
; PLAN: r0=121(x), r1=112(y), r2=52(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 121
LDI r1, 112
LDI r2, 52
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a blue dot at position (185, 35).
; PLAN: r0=185(x), r1=35(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 185
LDI r1, 35
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
