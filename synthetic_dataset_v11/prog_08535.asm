; DESCRIPTION: Composite: . Then Sets a single cyan pixel at (93, 34). Then Places a cyan circle of radius 49 at center (92, 63).
; PLAN: r0=93(x), r1=34(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=92(x), r1=63(y), r2=49(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single cyan pixel at (93, 34).
; PLAN: r0=93(x), r1=34(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 93
LDI r1, 34
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Places a cyan circle of radius 49 at center (92, 63).
; PLAN: r0=92(x), r1=63(y), r2=49(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 92
LDI r1, 63
LDI r2, 49
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
