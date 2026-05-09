; DESCRIPTION: Creates a blue circular shape at (185, 38) with radius 36.
; PLAN: r0=185(x), r1=38(y), r2=36(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 38
LDI r2, 36
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
