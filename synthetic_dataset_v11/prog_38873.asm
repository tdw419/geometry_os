; DESCRIPTION: Composite: . Then Draws a purple circle centered at (208, 48) with radius 19. Then Sets a single orange pixel at (16, 168).
; PLAN: r0=208(x), r1=48(y), r2=19(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=16(x), r1=168(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a purple circle centered at (208, 48) with radius 19.
; PLAN: r0=208(x), r1=48(y), r2=19(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 208
LDI r1, 48
LDI r2, 19
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single orange pixel at (16, 168).
; PLAN: r0=16(x), r1=168(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 16
LDI r1, 168
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
