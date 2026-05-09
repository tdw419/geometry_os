; DESCRIPTION: Composite: . Then Creates a red circular shape at (94, 220) with radius 20. Then Sets a single red pixel at (54, 237).
; PLAN: r0=94(x), r1=220(y), r2=20(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=54(x), r1=237(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a red circular shape at (94, 220) with radius 20.
; PLAN: r0=94(x), r1=220(y), r2=20(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 220
LDI r2, 20
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single red pixel at (54, 237).
; PLAN: r0=54(x), r1=237(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 54
LDI r1, 237
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
