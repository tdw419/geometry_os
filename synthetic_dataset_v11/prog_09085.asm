; DESCRIPTION: Composite: . Then Sets a single white pixel at (148, 191). Then Creates a blue circular shape at (100, 180) with radius 72.
; PLAN: r0=148(x), r1=191(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=100(x), r1=180(y), r2=72(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single white pixel at (148, 191).
; PLAN: r0=148(x), r1=191(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 148
LDI r1, 191
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Creates a blue circular shape at (100, 180) with radius 72.
; PLAN: r0=100(x), r1=180(y), r2=72(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 180
LDI r2, 72
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
