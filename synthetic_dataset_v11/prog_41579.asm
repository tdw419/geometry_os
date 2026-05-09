; DESCRIPTION: Creates a cyan circular shape at (56, 100) with radius 56.
; PLAN: r0=56(x), r1=100(y), r2=56(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 56
LDI r1, 100
LDI r2, 56
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
