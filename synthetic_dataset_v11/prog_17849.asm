; DESCRIPTION: Composite: . Then Sets a single cyan pixel at (17, 4). Then Creates a magenta circular shape at (200, 57) with radius 55.
; PLAN: r0=17(x), r1=4(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=200(x), r1=57(y), r2=55(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single cyan pixel at (17, 4).
; PLAN: r0=17(x), r1=4(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 17
LDI r1, 4
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Creates a magenta circular shape at (200, 57) with radius 55.
; PLAN: r0=200(x), r1=57(y), r2=55(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 200
LDI r1, 57
LDI r2, 55
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
