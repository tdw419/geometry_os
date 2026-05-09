; DESCRIPTION: Creates a cyan circular shape at (418, 71) with radius 55.
; PLAN: r0=418(x), r1=71(y), r2=55(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 418
LDI r1, 71
LDI r2, 55
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
