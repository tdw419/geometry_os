; DESCRIPTION: Composite: . Then Sets a single green pixel at (89, 43). Then Places a yellow circle of radius 34 at center (184, 145).
; PLAN: r0=89(x), r1=43(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=184(x), r1=145(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single green pixel at (89, 43).
; PLAN: r0=89(x), r1=43(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 89
LDI r1, 43
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Places a yellow circle of radius 34 at center (184, 145).
; PLAN: r0=184(x), r1=145(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 184
LDI r1, 145
LDI r2, 34
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
