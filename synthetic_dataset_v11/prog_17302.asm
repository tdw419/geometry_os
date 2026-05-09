; DESCRIPTION: Composite: . Then Sets a single cyan pixel at (75, 129). Then Creates a blue circular shape at (115, 115) with radius 37.
; PLAN: r0=75(x), r1=129(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=115(x), r1=115(y), r2=37(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single cyan pixel at (75, 129).
; PLAN: r0=75(x), r1=129(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 75
LDI r1, 129
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Creates a blue circular shape at (115, 115) with radius 37.
; PLAN: r0=115(x), r1=115(y), r2=37(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 115
LDI r2, 37
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
