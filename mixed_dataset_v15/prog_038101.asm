; DESCRIPTION: Renders a purple circular shape at (249, 150) with radius 11.
; PLAN: r0=249(x), r1=150(y), r2=11(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 249
LDI r1, 150
LDI r2, 11
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
