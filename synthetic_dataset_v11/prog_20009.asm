; DESCRIPTION: Composite: . Then Sets a single red pixel at (191, 245). Then Places a cyan circle of radius 80 at center (166, 96).
; PLAN: r0=191(x), r1=245(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=166(x), r1=96(y), r2=80(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single red pixel at (191, 245).
; PLAN: r0=191(x), r1=245(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 191
LDI r1, 245
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Places a cyan circle of radius 80 at center (166, 96).
; PLAN: r0=166(x), r1=96(y), r2=80(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 96
LDI r2, 80
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
