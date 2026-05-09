; DESCRIPTION: Creates a blue circular shape at (202, 219) with radius 37.
; PLAN: r0=202(x), r1=219(y), r2=37(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 219
LDI r2, 37
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
