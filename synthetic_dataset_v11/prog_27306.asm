; DESCRIPTION: Composite: . Then Sets a single purple pixel at (15, 136). Then Places a yellow circle of radius 35 at center (69, 192).
; PLAN: r0=15(x), r1=136(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=69(x), r1=192(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single purple pixel at (15, 136).
; PLAN: r0=15(x), r1=136(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 15
LDI r1, 136
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Places a yellow circle of radius 35 at center (69, 192).
; PLAN: r0=69(x), r1=192(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 69
LDI r1, 192
LDI r2, 35
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
