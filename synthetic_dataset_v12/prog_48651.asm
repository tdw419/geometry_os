; DESCRIPTION: Creates a cyan circular shape at (355, 128) with radius 10.
; PLAN: r0=355(x), r1=128(y), r2=10(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 355
LDI r1, 128
LDI r2, 10
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
