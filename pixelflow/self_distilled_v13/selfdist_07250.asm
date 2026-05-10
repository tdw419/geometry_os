; DESCRIPTION: Renders a purple circular shape at (176, 176) with radius 70.
; PLAN: r0=176(x), r1=176(y), r2=70(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 176
LDI r2, 70
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
