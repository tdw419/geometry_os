; DESCRIPTION: Creates a purple circular shape at (450, 114) with radius 38.
; PLAN: r0=450(x), r1=114(y), r2=38(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 450
LDI r1, 114
LDI r2, 38
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
