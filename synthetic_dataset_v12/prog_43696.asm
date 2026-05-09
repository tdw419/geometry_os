; DESCRIPTION: Creates a cyan circular shape at (187, 204) with radius 46.
; PLAN: r0=187(x), r1=204(y), r2=46(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 204
LDI r2, 46
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
