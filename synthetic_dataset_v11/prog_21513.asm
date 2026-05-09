; DESCRIPTION: Composite: . Then Places a white dot at position (246, 241). Then Places a green circle of radius 37 at center (77, 140).
; PLAN: r0=246(x), r1=241(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=77(x), r1=140(y), r2=37(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a white dot at position (246, 241).
; PLAN: r0=246(x), r1=241(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 246
LDI r1, 241
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Places a green circle of radius 37 at center (77, 140).
; PLAN: r0=77(x), r1=140(y), r2=37(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 140
LDI r2, 37
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
