; DESCRIPTION: Creates a cyan circular shape at (148, 176) with radius 15.
; PLAN: r0=148(x), r1=176(y), r2=15(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 176
LDI r2, 15
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
