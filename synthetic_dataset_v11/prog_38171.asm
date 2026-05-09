; DESCRIPTION: Composite: . Then Places a cyan dot at position (83, 190). Then Draws a black circle centered at (150, 161) with radius 73.
; PLAN: r0=83(x), r1=190(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=150(x), r1=161(y), r2=73(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a cyan dot at position (83, 190).
; PLAN: r0=83(x), r1=190(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 83
LDI r1, 190
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a black circle centered at (150, 161) with radius 73.
; PLAN: r0=150(x), r1=161(y), r2=73(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 150
LDI r1, 161
LDI r2, 73
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
