; DESCRIPTION: Composite: . Then Draws a purple circle centered at (62, 177) with radius 20. Then Places a yellow dot at position (19, 131).
; PLAN: r0=62(x), r1=177(y), r2=20(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=19(x), r1=131(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a purple circle centered at (62, 177) with radius 20.
; PLAN: r0=62(x), r1=177(y), r2=20(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 62
LDI r1, 177
LDI r2, 20
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a yellow dot at position (19, 131).
; PLAN: r0=19(x), r1=131(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 19
LDI r1, 131
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
