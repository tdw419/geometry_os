; DESCRIPTION: Creates a cyan circular shape at (151, 124) with radius 58.
; PLAN: r0=151(x), r1=124(y), r2=58(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 124
LDI r2, 58
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
