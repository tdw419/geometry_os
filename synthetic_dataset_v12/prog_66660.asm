; DESCRIPTION: Creates a cyan circular shape at (226, 38) with radius 31.
; PLAN: r0=226(x), r1=38(y), r2=31(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 226
LDI r1, 38
LDI r2, 31
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
