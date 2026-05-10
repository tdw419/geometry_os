; DESCRIPTION: Renders a purple circular shape at (315, 82) with radius 56.
; PLAN: r0=315(x), r1=82(y), r2=56(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 315
LDI r1, 82
LDI r2, 56
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
