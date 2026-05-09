; DESCRIPTION: Creates a black circular shape at (69, 212) with radius 44.
; PLAN: r0=69(x), r1=212(y), r2=44(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 69
LDI r1, 212
LDI r2, 44
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
