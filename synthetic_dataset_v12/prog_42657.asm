; DESCRIPTION: Creates a black circular shape at (443, 86) with radius 46.
; PLAN: r0=443(x), r1=86(y), r2=46(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 443
LDI r1, 86
LDI r2, 46
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
