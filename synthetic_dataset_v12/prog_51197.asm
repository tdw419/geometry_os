; DESCRIPTION: Draws a purple circle centered at (449, 190) with radius 25.
; PLAN: r0=449(x), r1=190(y), r2=25(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 449
LDI r1, 190
LDI r2, 25
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
