; DESCRIPTION: Creates a purple circular shape at (81, 142) with radius 59.
; PLAN: r0=81(x), r1=142(y), r2=59(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 142
LDI r2, 59
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
