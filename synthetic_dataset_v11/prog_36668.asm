; DESCRIPTION: Composite: . Then Draws a white circle centered at (83, 145) with radius 73. Then Places a yellow dot at position (28, 131).
; PLAN: r0=83(x), r1=145(y), r2=73(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=28(x), r1=131(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a white circle centered at (83, 145) with radius 73.
; PLAN: r0=83(x), r1=145(y), r2=73(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 145
LDI r2, 73
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a yellow dot at position (28, 131).
; PLAN: r0=28(x), r1=131(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 28
LDI r1, 131
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
