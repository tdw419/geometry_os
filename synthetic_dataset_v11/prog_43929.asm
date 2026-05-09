; DESCRIPTION: Composite: . Then Places a purple dot at position (140, 98). Then Renders a red disk with center (218, 45) and radius 19.
; PLAN: r0=140(x), r1=98(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=218(x), r1=45(y), r2=19(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a purple dot at position (140, 98).
; PLAN: r0=140(x), r1=98(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 140
LDI r1, 98
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a red disk with center (218, 45) and radius 19.
; PLAN: r0=218(x), r1=45(y), r2=19(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 218
LDI r1, 45
LDI r2, 19
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
