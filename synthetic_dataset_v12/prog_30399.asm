; DESCRIPTION: Creates a cyan circular shape at (78, 204) with radius 22.
; PLAN: r0=78(x), r1=204(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 78
LDI r1, 204
LDI r2, 22
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
