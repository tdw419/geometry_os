; DESCRIPTION: Creates a yellow circular shape at (169, 93) with radius 39.
; PLAN: r0=169(x), r1=93(y), r2=39(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 169
LDI r1, 93
LDI r2, 39
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
