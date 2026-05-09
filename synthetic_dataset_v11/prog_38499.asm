; DESCRIPTION: Composite: . Then Sets a single orange pixel at (32, 219). Then Places a purple circle of radius 58 at center (61, 135).
; PLAN: r0=32(x), r1=219(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=61(x), r1=135(y), r2=58(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single orange pixel at (32, 219).
; PLAN: r0=32(x), r1=219(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 32
LDI r1, 219
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Places a purple circle of radius 58 at center (61, 135).
; PLAN: r0=61(x), r1=135(y), r2=58(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 61
LDI r1, 135
LDI r2, 58
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
