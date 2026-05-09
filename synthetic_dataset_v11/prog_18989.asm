; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (207, 249). Then Draws a black circle centered at (77, 87) with radius 40.
; PLAN: r0=207(x), r1=249(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=77(x), r1=87(y), r2=40(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single yellow pixel at (207, 249).
; PLAN: r0=207(x), r1=249(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 207
LDI r1, 249
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Draws a black circle centered at (77, 87) with radius 40.
; PLAN: r0=77(x), r1=87(y), r2=40(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 87
LDI r2, 40
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
