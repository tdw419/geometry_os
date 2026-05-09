; DESCRIPTION: Composite: . Then Places a purple dot at position (202, 194). Then Places a blue circle of radius 21 at center (55, 219).
; PLAN: r0=202(x), r1=194(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=55(x), r1=219(y), r2=21(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a purple dot at position (202, 194).
; PLAN: r0=202(x), r1=194(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 202
LDI r1, 194
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Places a blue circle of radius 21 at center (55, 219).
; PLAN: r0=55(x), r1=219(y), r2=21(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 55
LDI r1, 219
LDI r2, 21
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
