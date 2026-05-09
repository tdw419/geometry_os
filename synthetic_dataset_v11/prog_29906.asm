; DESCRIPTION: Composite: . Then Places a white circle of radius 53 at center (77, 144). Then Sets a single cyan pixel at (102, 114).
; PLAN: r0=77(x), r1=144(y), r2=53(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=102(x), r1=114(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a white circle of radius 53 at center (77, 144).
; PLAN: r0=77(x), r1=144(y), r2=53(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 144
LDI r2, 53
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single cyan pixel at (102, 114).
; PLAN: r0=102(x), r1=114(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 102
LDI r1, 114
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
