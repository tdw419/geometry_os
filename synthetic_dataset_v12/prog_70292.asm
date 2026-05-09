; DESCRIPTION: Creates a cyan circular shape at (328, 78) with radius 77.
; PLAN: r0=328(x), r1=78(y), r2=77(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 328
LDI r1, 78
LDI r2, 77
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
