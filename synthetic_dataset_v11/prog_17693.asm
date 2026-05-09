; DESCRIPTION: Composite: . Then Sets a single green pixel at (81, 36). Then Places a cyan circle of radius 51 at center (146, 61).
; PLAN: r0=81(x), r1=36(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=146(x), r1=61(y), r2=51(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single green pixel at (81, 36).
; PLAN: r0=81(x), r1=36(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 81
LDI r1, 36
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Places a cyan circle of radius 51 at center (146, 61).
; PLAN: r0=146(x), r1=61(y), r2=51(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 61
LDI r2, 51
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
