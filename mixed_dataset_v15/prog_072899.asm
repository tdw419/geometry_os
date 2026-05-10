; DESCRIPTION: Creates a cyan circular shape at (438, 176) with radius 53.
; PLAN: r0=438(x), r1=176(y), r2=53(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 438
LDI r1, 176
LDI r2, 53
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
