; DESCRIPTION: Places a magenta disk with center (141, 200) and radius 10.
; PLAN: r0=141(x), r1=200(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 200
LDI r2, 10
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
