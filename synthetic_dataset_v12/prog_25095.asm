; DESCRIPTION: Creates a cyan circular shape at (100, 44) with radius 30.
; PLAN: r0=100(x), r1=44(y), r2=30(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 44
LDI r2, 30
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
