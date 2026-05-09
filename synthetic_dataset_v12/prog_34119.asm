; DESCRIPTION: Draws a purple circle centered at (401, 190) with radius 36.
; PLAN: r0=401(x), r1=190(y), r2=36(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 401
LDI r1, 190
LDI r2, 36
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
