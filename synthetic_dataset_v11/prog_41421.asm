; DESCRIPTION: Creates a red circular shape at (185, 87) with radius 65.
; PLAN: r0=185(x), r1=87(y), r2=65(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 87
LDI r2, 65
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
