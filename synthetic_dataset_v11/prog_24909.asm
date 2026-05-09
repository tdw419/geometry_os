; DESCRIPTION: Creates a cyan circular shape at (177, 145) with radius 69.
; PLAN: r0=177(x), r1=145(y), r2=69(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 145
LDI r2, 69
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
