; DESCRIPTION: Creates a black circular shape at (359, 178) with radius 46.
; PLAN: r0=359(x), r1=178(y), r2=46(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 359
LDI r1, 178
LDI r2, 46
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
