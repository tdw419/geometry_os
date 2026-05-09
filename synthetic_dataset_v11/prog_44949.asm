; DESCRIPTION: Composite: . Then Sets a single white pixel at (217, 84). Then Creates a purple circular shape at (124, 117) with radius 66.
; PLAN: r0=217(x), r1=84(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=124(x), r1=117(y), r2=66(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single white pixel at (217, 84).
; PLAN: r0=217(x), r1=84(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 217
LDI r1, 84
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Creates a purple circular shape at (124, 117) with radius 66.
; PLAN: r0=124(x), r1=117(y), r2=66(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 124
LDI r1, 117
LDI r2, 66
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
