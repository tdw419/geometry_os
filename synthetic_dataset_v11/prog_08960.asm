; DESCRIPTION: Creates a purple circular shape at (234, 223) with radius 21.
; PLAN: r0=234(x), r1=223(y), r2=21(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 234
LDI r1, 223
LDI r2, 21
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
