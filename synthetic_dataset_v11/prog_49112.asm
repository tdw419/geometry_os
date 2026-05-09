; DESCRIPTION: Composite: . Then Places a yellow circle of radius 43 at center (98, 165). Then Sets a single green pixel at (221, 183).
; PLAN: r0=98(x), r1=165(y), r2=43(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=221(x), r1=183(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a yellow circle of radius 43 at center (98, 165).
; PLAN: r0=98(x), r1=165(y), r2=43(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 165
LDI r2, 43
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single green pixel at (221, 183).
; PLAN: r0=221(x), r1=183(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 221
LDI r1, 183
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
