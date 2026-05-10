; DESCRIPTION: Creates a cyan circular shape at (71, 191) with radius 61.
; PLAN: r0=71(x), r1=191(y), r2=61(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 71
LDI r1, 191
LDI r2, 61
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
