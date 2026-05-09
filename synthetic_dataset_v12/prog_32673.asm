; DESCRIPTION: Creates a black circular shape at (80, 198) with radius 28.
; PLAN: r0=80(x), r1=198(y), r2=28(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 80
LDI r1, 198
LDI r2, 28
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
