; DESCRIPTION: Renders a purple circular shape at (63, 160) with radius 52.
; PLAN: r0=63(x), r1=160(y), r2=52(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 63
LDI r1, 160
LDI r2, 52
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
