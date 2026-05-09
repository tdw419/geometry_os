; DESCRIPTION: Composite: . Then Places a black circle of radius 55 at center (144, 158). Then Sets a single cyan pixel at (112, 233).
; PLAN: r0=144(x), r1=158(y), r2=55(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=112(x), r1=233(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a black circle of radius 55 at center (144, 158).
; PLAN: r0=144(x), r1=158(y), r2=55(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 158
LDI r2, 55
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single cyan pixel at (112, 233).
; PLAN: r0=112(x), r1=233(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 112
LDI r1, 233
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
