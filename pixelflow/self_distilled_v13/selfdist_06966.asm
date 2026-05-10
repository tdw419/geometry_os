; DESCRIPTION: Renders a purple circular shape at (296, 23) with radius 56.
; PLAN: r0=296(x), r1=23(y), r2=56(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 296
LDI r1, 23
LDI r2, 56
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
