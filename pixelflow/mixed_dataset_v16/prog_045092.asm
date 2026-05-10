; DESCRIPTION: Renders a purple circular shape at (195, 95) with radius 55.
; PLAN: r0=195(x), r1=95(y), r2=55(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 95
LDI r2, 55
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
