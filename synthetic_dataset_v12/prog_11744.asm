; DESCRIPTION: Creates a red circular shape at (185, 37) with radius 18.
; PLAN: r0=185(x), r1=37(y), r2=18(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 37
LDI r2, 18
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
