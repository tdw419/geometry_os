; DESCRIPTION: Composite: . Then Places a black circle of radius 49 at center (163, 165). Then Sets a single green pixel at (135, 156).
; PLAN: r0=163(x), r1=165(y), r2=49(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=135(x), r1=156(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a black circle of radius 49 at center (163, 165).
; PLAN: r0=163(x), r1=165(y), r2=49(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 163
LDI r1, 165
LDI r2, 49
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single green pixel at (135, 156).
; PLAN: r0=135(x), r1=156(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 135
LDI r1, 156
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
