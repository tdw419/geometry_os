; DESCRIPTION: Creates a black circular shape at (393, 171) with radius 40.
; PLAN: r0=393(x), r1=171(y), r2=40(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 393
LDI r1, 171
LDI r2, 40
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
