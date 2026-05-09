; DESCRIPTION: Creates a black circular shape at (192, 50) with radius 46.
; PLAN: r0=192(x), r1=50(y), r2=46(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 50
LDI r2, 46
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
