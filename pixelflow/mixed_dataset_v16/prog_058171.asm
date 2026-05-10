; DESCRIPTION: Renders a purple circular shape at (315, 190) with radius 39.
; PLAN: r0=315(x), r1=190(y), r2=39(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 315
LDI r1, 190
LDI r2, 39
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
