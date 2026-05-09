; DESCRIPTION: Composite: . Then Sets a single cyan pixel at (134, 4). Then Creates a yellow circular shape at (216, 217) with radius 13.
; PLAN: r0=134(x), r1=4(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=216(x), r1=217(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single cyan pixel at (134, 4).
; PLAN: r0=134(x), r1=4(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 134
LDI r1, 4
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Creates a yellow circular shape at (216, 217) with radius 13.
; PLAN: r0=216(x), r1=217(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 217
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
