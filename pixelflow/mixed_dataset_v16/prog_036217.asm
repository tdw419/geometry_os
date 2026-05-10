; DESCRIPTION: Draws a purple circle centered at (59, 190) with radius 37.
; PLAN: r0=59(x), r1=190(y), r2=37(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 190
LDI r2, 37
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
