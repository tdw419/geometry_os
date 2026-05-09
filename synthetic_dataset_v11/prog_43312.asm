; DESCRIPTION: Composite: . Then Renders a white disk with center (75, 65) and radius 56. Then Sets a single magenta pixel at (147, 40).
; PLAN: r0=75(x), r1=65(y), r2=56(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=147(x), r1=40(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a white disk with center (75, 65) and radius 56.
; PLAN: r0=75(x), r1=65(y), r2=56(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 65
LDI r2, 56
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single magenta pixel at (147, 40).
; PLAN: r0=147(x), r1=40(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 147
LDI r1, 40
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
