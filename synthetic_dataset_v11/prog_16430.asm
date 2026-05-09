; DESCRIPTION: Composite: . Then Sets a single white pixel at (106, 161). Then Renders a magenta disk with center (62, 118) and radius 30.
; PLAN: r0=106(x), r1=161(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=62(x), r1=118(y), r2=30(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single white pixel at (106, 161).
; PLAN: r0=106(x), r1=161(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 106
LDI r1, 161
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a magenta disk with center (62, 118) and radius 30.
; PLAN: r0=62(x), r1=118(y), r2=30(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 62
LDI r1, 118
LDI r2, 30
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
