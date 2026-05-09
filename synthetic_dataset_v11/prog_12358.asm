; DESCRIPTION: Composite: . Then Sets a single cyan pixel at (189, 71). Then Places a purple circle of radius 44 at center (44, 207).
; PLAN: r0=189(x), r1=71(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=44(x), r1=207(y), r2=44(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single cyan pixel at (189, 71).
; PLAN: r0=189(x), r1=71(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 189
LDI r1, 71
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Places a purple circle of radius 44 at center (44, 207).
; PLAN: r0=44(x), r1=207(y), r2=44(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 44
LDI r1, 207
LDI r2, 44
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
