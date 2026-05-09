; DESCRIPTION: Creates a cyan circular shape at (151, 14) with radius 10.
; PLAN: r0=151(x), r1=14(y), r2=10(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 14
LDI r2, 10
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
