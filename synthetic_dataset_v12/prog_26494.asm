; DESCRIPTION: Creates a purple circular shape at (386, 106) with radius 58.
; PLAN: r0=386(x), r1=106(y), r2=58(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 386
LDI r1, 106
LDI r2, 58
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
