; DESCRIPTION: Places a magenta circle of radius 44 at center (269, 110).
; PLAN: r0=269(x), r1=110(y), r2=44(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 269
LDI r1, 110
LDI r2, 44
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
