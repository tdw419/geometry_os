; DESCRIPTION: Places a black circle of radius 62 at center (443, 73).
; PLAN: r0=443(x), r1=73(y), r2=62(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 443
LDI r1, 73
LDI r2, 62
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
