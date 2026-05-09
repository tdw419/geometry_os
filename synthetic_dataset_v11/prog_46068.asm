; DESCRIPTION: Composite: . Then Sets a single white pixel at (188, 215). Then Creates a purple circular shape at (188, 179) with radius 54.
; PLAN: r0=188(x), r1=215(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=188(x), r1=179(y), r2=54(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single white pixel at (188, 215).
; PLAN: r0=188(x), r1=215(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 188
LDI r1, 215
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Creates a purple circular shape at (188, 179) with radius 54.
; PLAN: r0=188(x), r1=179(y), r2=54(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 179
LDI r2, 54
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
