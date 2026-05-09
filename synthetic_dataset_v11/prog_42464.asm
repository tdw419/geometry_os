; DESCRIPTION: Composite: . Then Creates a blue circular shape at (233, 184) with radius 21. Then Sets a single white pixel at (232, 252).
; PLAN: r0=233(x), r1=184(y), r2=21(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=232(x), r1=252(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a blue circular shape at (233, 184) with radius 21.
; PLAN: r0=233(x), r1=184(y), r2=21(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 233
LDI r1, 184
LDI r2, 21
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single white pixel at (232, 252).
; PLAN: r0=232(x), r1=252(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 232
LDI r1, 252
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
