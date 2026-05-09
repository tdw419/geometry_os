; DESCRIPTION: Creates a purple circular shape at (73, 186) with radius 58.
; PLAN: r0=73(x), r1=186(y), r2=58(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 73
LDI r1, 186
LDI r2, 58
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
