; DESCRIPTION: Composite: . Then Sets a single white pixel at (221, 201). Then Places a red circle of radius 45 at center (183, 209).
; PLAN: r0=221(x), r1=201(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=183(x), r1=209(y), r2=45(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single white pixel at (221, 201).
; PLAN: r0=221(x), r1=201(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 221
LDI r1, 201
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Places a red circle of radius 45 at center (183, 209).
; PLAN: r0=183(x), r1=209(y), r2=45(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 183
LDI r1, 209
LDI r2, 45
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
