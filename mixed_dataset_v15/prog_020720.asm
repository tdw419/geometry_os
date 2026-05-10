; DESCRIPTION: Creates a cyan circular shape at (336, 191) with radius 43.
; PLAN: r0=336(x), r1=191(y), r2=43(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 336
LDI r1, 191
LDI r2, 43
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
