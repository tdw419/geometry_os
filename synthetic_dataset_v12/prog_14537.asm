; DESCRIPTION: Creates a purple circular shape at (285, 113) with radius 72.
; PLAN: r0=285(x), r1=113(y), r2=72(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 285
LDI r1, 113
LDI r2, 72
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
