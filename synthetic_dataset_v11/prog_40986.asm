; DESCRIPTION: Composite: . Then Places a black circle of radius 40 at center (155, 111). Then Sets a single green pixel at (3, 158).
; PLAN: r0=155(x), r1=111(y), r2=40(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=3(x), r1=158(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a black circle of radius 40 at center (155, 111).
; PLAN: r0=155(x), r1=111(y), r2=40(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 111
LDI r2, 40
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single green pixel at (3, 158).
; PLAN: r0=3(x), r1=158(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 3
LDI r1, 158
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
