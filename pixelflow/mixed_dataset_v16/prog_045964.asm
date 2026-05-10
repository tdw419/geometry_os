; DESCRIPTION: Creates a black circular shape at (408, 162) with radius 46.
; PLAN: r0=408(x), r1=162(y), r2=46(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 408
LDI r1, 162
LDI r2, 46
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
