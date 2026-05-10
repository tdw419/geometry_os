; DESCRIPTION: Creates a purple circular shape at (54, 108) with radius 17.
; PLAN: r0=54(x), r1=108(y), r2=17(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 54
LDI r1, 108
LDI r2, 17
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
