; DESCRIPTION: Creates a purple circular shape at (258, 73) with radius 59.
; PLAN: r0=258(x), r1=73(y), r2=59(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 258
LDI r1, 73
LDI r2, 59
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
