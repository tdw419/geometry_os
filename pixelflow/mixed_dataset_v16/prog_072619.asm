; DESCRIPTION: Creates a black circular shape at (288, 127) with radius 58.
; PLAN: r0=288(x), r1=127(y), r2=58(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 288
LDI r1, 127
LDI r2, 58
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
