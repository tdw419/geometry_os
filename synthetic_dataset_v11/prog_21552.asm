; DESCRIPTION: Composite: . Then Sets a single white pixel at (124, 141). Then Renders a magenta disk with center (144, 77) and radius 72.
; PLAN: r0=124(x), r1=141(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=144(x), r1=77(y), r2=72(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single white pixel at (124, 141).
; PLAN: r0=124(x), r1=141(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 124
LDI r1, 141
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a magenta disk with center (144, 77) and radius 72.
; PLAN: r0=144(x), r1=77(y), r2=72(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 77
LDI r2, 72
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
