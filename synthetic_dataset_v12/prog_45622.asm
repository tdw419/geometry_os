; DESCRIPTION: Creates a blue circular shape at (87, 38) with radius 17.
; PLAN: r0=87(x), r1=38(y), r2=17(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 38
LDI r2, 17
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
