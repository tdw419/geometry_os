; DESCRIPTION: Creates a cyan circular shape at (148, 181) with radius 66.
; PLAN: r0=148(x), r1=181(y), r2=66(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 181
LDI r2, 66
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
