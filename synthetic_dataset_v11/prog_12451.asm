; DESCRIPTION: Composite: . Then Sets a single white pixel at (154, 144). Then Places a purple circle of radius 72 at center (159, 142).
; PLAN: r0=154(x), r1=144(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=159(x), r1=142(y), r2=72(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single white pixel at (154, 144).
; PLAN: r0=154(x), r1=144(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 154
LDI r1, 144
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Places a purple circle of radius 72 at center (159, 142).
; PLAN: r0=159(x), r1=142(y), r2=72(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 142
LDI r2, 72
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
