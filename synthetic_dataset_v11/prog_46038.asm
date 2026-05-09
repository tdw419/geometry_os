; DESCRIPTION: Composite: . Then Creates a yellow circular shape at (124, 95) with radius 23. Then Places a purple dot at position (34, 157).
; PLAN: r0=124(x), r1=95(y), r2=23(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=34(x), r1=157(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a yellow circular shape at (124, 95) with radius 23.
; PLAN: r0=124(x), r1=95(y), r2=23(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 124
LDI r1, 95
LDI r2, 23
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a purple dot at position (34, 157).
; PLAN: r0=34(x), r1=157(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 34
LDI r1, 157
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
