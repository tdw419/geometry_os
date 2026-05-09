; DESCRIPTION: Creates a green circular shape at (405, 212) with radius 34.
; PLAN: r0=405(x), r1=212(y), r2=34(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 405
LDI r1, 212
LDI r2, 34
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
