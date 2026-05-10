; DESCRIPTION: Renders a purple circular shape at (335, 40) with radius 77.
; PLAN: r0=335(x), r1=40(y), r2=77(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 335
LDI r1, 40
LDI r2, 77
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
