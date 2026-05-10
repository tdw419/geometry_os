; DESCRIPTION: Renders a purple circular shape at (341, 150) with radius 61.
; PLAN: r0=341(x), r1=150(y), r2=61(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 341
LDI r1, 150
LDI r2, 61
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
