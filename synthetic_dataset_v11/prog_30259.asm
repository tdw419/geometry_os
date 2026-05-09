; DESCRIPTION: Creates a cyan circular shape at (157, 177) with radius 58.
; PLAN: r0=157(x), r1=177(y), r2=58(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 177
LDI r2, 58
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
