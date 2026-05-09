; DESCRIPTION: Creates a purple circular shape at (127, 102) with radius 10.
; PLAN: r0=127(x), r1=102(y), r2=10(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 102
LDI r2, 10
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
