; DESCRIPTION: Creates a red circular shape at (438, 199) with radius 55.
; PLAN: r0=438(x), r1=199(y), r2=55(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 438
LDI r1, 199
LDI r2, 55
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
