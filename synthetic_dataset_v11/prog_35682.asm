; DESCRIPTION: Composite: . Then Renders a orange disk with center (55, 119) and radius 53. Then Places a purple dot at position (87, 180).
; PLAN: r0=55(x), r1=119(y), r2=53(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=87(x), r1=180(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a orange disk with center (55, 119) and radius 53.
; PLAN: r0=55(x), r1=119(y), r2=53(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 55
LDI r1, 119
LDI r2, 53
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a purple dot at position (87, 180).
; PLAN: r0=87(x), r1=180(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 87
LDI r1, 180
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
