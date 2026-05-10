; DESCRIPTION: Creates a purple circular shape at (428, 171) with radius 59.
; PLAN: r0=428(x), r1=171(y), r2=59(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 428
LDI r1, 171
LDI r2, 59
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
