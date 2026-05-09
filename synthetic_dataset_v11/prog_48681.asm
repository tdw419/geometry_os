; DESCRIPTION: Creates a cyan circular shape at (177, 101) with radius 79.
; PLAN: r0=177(x), r1=101(y), r2=79(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 101
LDI r2, 79
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
