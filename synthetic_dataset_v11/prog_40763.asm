; DESCRIPTION: Composite: . Then Sets a single purple pixel at (216, 130). Then Draws a white circle centered at (165, 127) with radius 79.
; PLAN: r0=216(x), r1=130(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=165(x), r1=127(y), r2=79(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single purple pixel at (216, 130).
; PLAN: r0=216(x), r1=130(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 216
LDI r1, 130
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a white circle centered at (165, 127) with radius 79.
; PLAN: r0=165(x), r1=127(y), r2=79(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 127
LDI r2, 79
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
