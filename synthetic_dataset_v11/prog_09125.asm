; DESCRIPTION: Composite: . Then Sets a single cyan pixel at (111, 78). Then Places a magenta circle of radius 58 at center (138, 104).
; PLAN: r0=111(x), r1=78(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=138(x), r1=104(y), r2=58(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single cyan pixel at (111, 78).
; PLAN: r0=111(x), r1=78(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 111
LDI r1, 78
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Places a magenta circle of radius 58 at center (138, 104).
; PLAN: r0=138(x), r1=104(y), r2=58(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 104
LDI r2, 58
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
