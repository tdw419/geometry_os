; DESCRIPTION: Creates a purple circular shape at (352, 184) with radius 32.
; PLAN: r0=352(x), r1=184(y), r2=32(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 352
LDI r1, 184
LDI r2, 32
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
