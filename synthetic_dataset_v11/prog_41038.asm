; DESCRIPTION: Composite: . Then Renders a white disk with center (174, 144) and radius 65. Then Sets a single magenta pixel at (205, 94).
; PLAN: r0=174(x), r1=144(y), r2=65(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=205(x), r1=94(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a white disk with center (174, 144) and radius 65.
; PLAN: r0=174(x), r1=144(y), r2=65(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 144
LDI r2, 65
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single magenta pixel at (205, 94).
; PLAN: r0=205(x), r1=94(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 205
LDI r1, 94
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
