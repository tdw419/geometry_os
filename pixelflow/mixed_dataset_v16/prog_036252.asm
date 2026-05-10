; DESCRIPTION: Creates a purple circular shape at (59, 90) with radius 54.
; PLAN: r0=59(x), r1=90(y), r2=54(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 90
LDI r2, 54
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
