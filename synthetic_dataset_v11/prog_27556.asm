; DESCRIPTION: Composite: . Then Creates a yellow circular shape at (211, 97) with radius 35. Then Sets a single cyan pixel at (222, 238).
; PLAN: r0=211(x), r1=97(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=222(x), r1=238(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a yellow circular shape at (211, 97) with radius 35.
; PLAN: r0=211(x), r1=97(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 211
LDI r1, 97
LDI r2, 35
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single cyan pixel at (222, 238).
; PLAN: r0=222(x), r1=238(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 222
LDI r1, 238
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
