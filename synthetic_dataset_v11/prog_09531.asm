; DESCRIPTION: Creates a cyan circular shape at (141, 151) with radius 80.
; PLAN: r0=141(x), r1=151(y), r2=80(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 151
LDI r2, 80
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
