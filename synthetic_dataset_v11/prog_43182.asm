; DESCRIPTION: Composite: . Then Creates a purple circular shape at (198, 74) with radius 40. Then Sets a single cyan pixel at (23, 51).
; PLAN: r0=198(x), r1=74(y), r2=40(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=23(x), r1=51(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a purple circular shape at (198, 74) with radius 40.
; PLAN: r0=198(x), r1=74(y), r2=40(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 198
LDI r1, 74
LDI r2, 40
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single cyan pixel at (23, 51).
; PLAN: r0=23(x), r1=51(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 23
LDI r1, 51
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
