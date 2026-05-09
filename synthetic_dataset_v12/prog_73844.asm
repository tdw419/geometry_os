; DESCRIPTION: Creates a yellow circular shape at (82, 118) with radius 71.
; PLAN: r0=82(x), r1=118(y), r2=71(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 118
LDI r2, 71
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
