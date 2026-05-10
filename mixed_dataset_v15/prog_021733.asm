; DESCRIPTION: Creates a red circular shape at (177, 149) with radius 25.
; PLAN: r0=177(x), r1=149(y), r2=25(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 149
LDI r2, 25
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
