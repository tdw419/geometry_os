; DESCRIPTION: Creates a red circular shape at (177, 115) with radius 80.
; PLAN: r0=177(x), r1=115(y), r2=80(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 115
LDI r2, 80
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
