; DESCRIPTION: Composite: . Then Draws a purple circle centered at (80, 27) with radius 27. Then Sets a single orange pixel at (108, 31).
; PLAN: r0=80(x), r1=27(y), r2=27(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=108(x), r1=31(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a purple circle centered at (80, 27) with radius 27.
; PLAN: r0=80(x), r1=27(y), r2=27(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 80
LDI r1, 27
LDI r2, 27
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single orange pixel at (108, 31).
; PLAN: r0=108(x), r1=31(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 108
LDI r1, 31
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
