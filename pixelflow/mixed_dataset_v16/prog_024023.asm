; DESCRIPTION: Creates a yellow circular shape at (177, 73) with radius 61.
; PLAN: r0=177(x), r1=73(y), r2=61(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 73
LDI r2, 61
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
