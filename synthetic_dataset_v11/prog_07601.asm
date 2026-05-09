; DESCRIPTION: Composite: . Then Sets a single green pixel at (231, 210). Then Draws a black circle centered at (93, 80) with radius 23.
; PLAN: r0=231(x), r1=210(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=93(x), r1=80(y), r2=23(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single green pixel at (231, 210).
; PLAN: r0=231(x), r1=210(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 231
LDI r1, 210
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Draws a black circle centered at (93, 80) with radius 23.
; PLAN: r0=93(x), r1=80(y), r2=23(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 93
LDI r1, 80
LDI r2, 23
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
