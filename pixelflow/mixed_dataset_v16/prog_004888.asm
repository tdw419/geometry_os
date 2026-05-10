; DESCRIPTION: Creates a cyan circular shape at (247, 66) with radius 60.
; PLAN: r0=247(x), r1=66(y), r2=60(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 247
LDI r1, 66
LDI r2, 60
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
