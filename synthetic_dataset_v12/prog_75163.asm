; DESCRIPTION: Places a purple circle of radius 33 at center (165, 214).
; PLAN: r0=165(x), r1=214(y), r2=33(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 214
LDI r2, 33
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
