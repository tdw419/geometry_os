; DESCRIPTION: Composite: . Then Creates a yellow circular shape at (91, 52) with radius 31. Then Places a purple dot at position (126, 242).
; PLAN: r0=91(x), r1=52(y), r2=31(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=126(x), r1=242(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a yellow circular shape at (91, 52) with radius 31.
; PLAN: r0=91(x), r1=52(y), r2=31(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 52
LDI r2, 31
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a purple dot at position (126, 242).
; PLAN: r0=126(x), r1=242(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 126
LDI r1, 242
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
