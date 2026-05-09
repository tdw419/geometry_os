; DESCRIPTION: Composite: . Then Places a magenta circle of radius 78 at center (129, 111). Then Sets a single red pixel at (131, 148).
; PLAN: r0=129(x), r1=111(y), r2=78(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=131(x), r1=148(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a magenta circle of radius 78 at center (129, 111).
; PLAN: r0=129(x), r1=111(y), r2=78(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 111
LDI r2, 78
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single red pixel at (131, 148).
; PLAN: r0=131(x), r1=148(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 131
LDI r1, 148
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
