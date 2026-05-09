; DESCRIPTION: Composite: . Then Creates a purple circular shape at (112, 38) with radius 34. Then Sets a single black pixel at (82, 24).
; PLAN: r0=112(x), r1=38(y), r2=34(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=82(x), r1=24(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a purple circular shape at (112, 38) with radius 34.
; PLAN: r0=112(x), r1=38(y), r2=34(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 38
LDI r2, 34
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single black pixel at (82, 24).
; PLAN: r0=82(x), r1=24(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 82
LDI r1, 24
LDI r2, 0x000000
PSET r0, r1, r2
HALT
