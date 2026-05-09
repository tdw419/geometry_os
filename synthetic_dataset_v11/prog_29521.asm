; DESCRIPTION: Creates a cyan circular shape at (148, 157) with radius 47.
; PLAN: r0=148(x), r1=157(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 157
LDI r2, 47
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
