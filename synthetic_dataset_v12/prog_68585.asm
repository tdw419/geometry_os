; DESCRIPTION: Creates a cyan circular shape at (47, 112) with radius 12.
; PLAN: r0=47(x), r1=112(y), r2=12(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 47
LDI r1, 112
LDI r2, 12
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
