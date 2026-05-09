; DESCRIPTION: Creates a cyan circular shape at (99, 56) with radius 47.
; PLAN: r0=99(x), r1=56(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 99
LDI r1, 56
LDI r2, 47
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
