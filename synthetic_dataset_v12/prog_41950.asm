; DESCRIPTION: Creates a cyan circular shape at (293, 217) with radius 10.
; PLAN: r0=293(x), r1=217(y), r2=10(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 293
LDI r1, 217
LDI r2, 10
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
