; DESCRIPTION: Creates a blue circular shape at (364, 47) with radius 44.
; PLAN: r0=364(x), r1=47(y), r2=44(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 364
LDI r1, 47
LDI r2, 44
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
