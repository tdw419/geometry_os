; DESCRIPTION: Composite: . Then Sets a single cyan pixel at (50, 238). Then Places a green circle of radius 36 at center (110, 155).
; PLAN: r0=50(x), r1=238(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=110(x), r1=155(y), r2=36(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single cyan pixel at (50, 238).
; PLAN: r0=50(x), r1=238(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 50
LDI r1, 238
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Places a green circle of radius 36 at center (110, 155).
; PLAN: r0=110(x), r1=155(y), r2=36(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 155
LDI r2, 36
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
