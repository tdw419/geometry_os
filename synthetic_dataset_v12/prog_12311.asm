; DESCRIPTION: Creates a purple circular shape at (304, 215) with radius 17.
; PLAN: r0=304(x), r1=215(y), r2=17(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 304
LDI r1, 215
LDI r2, 17
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
