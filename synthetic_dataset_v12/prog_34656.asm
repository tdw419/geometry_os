; DESCRIPTION: Creates a black circular shape at (443, 191) with radius 65.
; PLAN: r0=443(x), r1=191(y), r2=65(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 443
LDI r1, 191
LDI r2, 65
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
