; DESCRIPTION: Composite: . Then Sets a single purple pixel at (192, 52). Then Places a white circle of radius 56 at center (185, 173).
; PLAN: r0=192(x), r1=52(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=185(x), r1=173(y), r2=56(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single purple pixel at (192, 52).
; PLAN: r0=192(x), r1=52(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 192
LDI r1, 52
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Places a white circle of radius 56 at center (185, 173).
; PLAN: r0=185(x), r1=173(y), r2=56(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 173
LDI r2, 56
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
