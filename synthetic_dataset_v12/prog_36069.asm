; DESCRIPTION: Creates a yellow circular shape at (432, 72) with radius 44.
; PLAN: r0=432(x), r1=72(y), r2=44(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 432
LDI r1, 72
LDI r2, 44
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
