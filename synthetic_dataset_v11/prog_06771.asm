; DESCRIPTION: Creates a cyan circular shape at (141, 53) with radius 47.
; PLAN: r0=141(x), r1=53(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 53
LDI r2, 47
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
