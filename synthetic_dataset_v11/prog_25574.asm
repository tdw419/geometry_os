; DESCRIPTION: Creates a cyan circular shape at (51, 179) with radius 22.
; PLAN: r0=51(x), r1=179(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 51
LDI r1, 179
LDI r2, 22
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
