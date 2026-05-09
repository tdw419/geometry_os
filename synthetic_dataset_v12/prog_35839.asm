; DESCRIPTION: Creates a purple circular shape at (59, 87) with radius 50.
; PLAN: r0=59(x), r1=87(y), r2=50(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 87
LDI r2, 50
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
