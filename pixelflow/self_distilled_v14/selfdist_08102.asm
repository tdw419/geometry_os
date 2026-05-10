; DESCRIPTION: Renders a purple circular shape at (288, 57) with radius 65.
; PLAN: r0=288(x), r1=57(y), r2=65(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 288
LDI r1, 57
LDI r2, 65
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
