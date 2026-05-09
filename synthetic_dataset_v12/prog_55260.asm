; DESCRIPTION: Creates a cyan circular shape at (204, 143) with radius 76.
; PLAN: r0=204(x), r1=143(y), r2=76(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 143
LDI r2, 76
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
