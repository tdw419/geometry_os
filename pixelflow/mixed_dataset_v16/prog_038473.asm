; DESCRIPTION: Creates a blue circular shape at (438, 95) with radius 53.
; PLAN: r0=438(x), r1=95(y), r2=53(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 438
LDI r1, 95
LDI r2, 53
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
