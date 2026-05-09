; DESCRIPTION: Composite: . Then Places a red circle of radius 11 at center (47, 144). Then Sets a single green pixel at (70, 189).
; PLAN: r0=47(x), r1=144(y), r2=11(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=70(x), r1=189(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a red circle of radius 11 at center (47, 144).
; PLAN: r0=47(x), r1=144(y), r2=11(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 47
LDI r1, 144
LDI r2, 11
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single green pixel at (70, 189).
; PLAN: r0=70(x), r1=189(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 70
LDI r1, 189
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
