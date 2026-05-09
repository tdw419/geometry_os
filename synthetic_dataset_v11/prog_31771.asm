; DESCRIPTION: Composite: . Then Places a yellow circle of radius 14 at center (77, 102). Then Sets a single orange pixel at (117, 17).
; PLAN: r0=77(x), r1=102(y), r2=14(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=117(x), r1=17(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a yellow circle of radius 14 at center (77, 102).
; PLAN: r0=77(x), r1=102(y), r2=14(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 102
LDI r2, 14
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single orange pixel at (117, 17).
; PLAN: r0=117(x), r1=17(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 117
LDI r1, 17
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
