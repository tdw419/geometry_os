; DESCRIPTION: Composite: . Then Creates a red circular shape at (216, 123) with radius 20. Then Sets a single cyan pixel at (9, 195).
; PLAN: r0=216(x), r1=123(y), r2=20(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=9(x), r1=195(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a red circular shape at (216, 123) with radius 20.
; PLAN: r0=216(x), r1=123(y), r2=20(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 123
LDI r2, 20
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single cyan pixel at (9, 195).
; PLAN: r0=9(x), r1=195(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 9
LDI r1, 195
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
