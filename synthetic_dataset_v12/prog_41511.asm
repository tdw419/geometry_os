; DESCRIPTION: Creates a cyan circular shape at (463, 146) with radius 45.
; PLAN: r0=463(x), r1=146(y), r2=45(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 463
LDI r1, 146
LDI r2, 45
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
