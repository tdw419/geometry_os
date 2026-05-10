; DESCRIPTION: Creates a blue circular shape at (112, 57) with radius 46.
; PLAN: r0=112(x), r1=57(y), r2=46(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 57
LDI r2, 46
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
