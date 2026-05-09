; DESCRIPTION: Creates a cyan circular shape at (204, 193) with radius 32.
; PLAN: r0=204(x), r1=193(y), r2=32(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 193
LDI r2, 32
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
