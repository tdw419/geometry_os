; DESCRIPTION: Creates a purple circular shape at (187, 177) with radius 66.
; PLAN: r0=187(x), r1=177(y), r2=66(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 177
LDI r2, 66
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
