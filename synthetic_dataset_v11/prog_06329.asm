; DESCRIPTION: Composite: . Then Creates a purple circular shape at (228, 90) with radius 21. Then Sets a single red pixel at (141, 120).
; PLAN: r0=228(x), r1=90(y), r2=21(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=141(x), r1=120(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a purple circular shape at (228, 90) with radius 21.
; PLAN: r0=228(x), r1=90(y), r2=21(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 228
LDI r1, 90
LDI r2, 21
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single red pixel at (141, 120).
; PLAN: r0=141(x), r1=120(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 141
LDI r1, 120
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
