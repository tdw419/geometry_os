; DESCRIPTION: Composite: . Then Renders a white disk with center (210, 180) and radius 31. Then Sets a single orange pixel at (85, 216).
; PLAN: r0=210(x), r1=180(y), r2=31(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=85(x), r1=216(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a white disk with center (210, 180) and radius 31.
; PLAN: r0=210(x), r1=180(y), r2=31(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 210
LDI r1, 180
LDI r2, 31
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single orange pixel at (85, 216).
; PLAN: r0=85(x), r1=216(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 85
LDI r1, 216
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
