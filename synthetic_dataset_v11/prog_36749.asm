; DESCRIPTION: Composite: . Then Sets a single cyan pixel at (83, 27). Then Draws a purple circle centered at (87, 165) with radius 70.
; PLAN: r0=83(x), r1=27(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=87(x), r1=165(y), r2=70(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single cyan pixel at (83, 27).
; PLAN: r0=83(x), r1=27(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 83
LDI r1, 27
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a purple circle centered at (87, 165) with radius 70.
; PLAN: r0=87(x), r1=165(y), r2=70(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 165
LDI r2, 70
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
