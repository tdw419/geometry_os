; DESCRIPTION: Creates a yellow circular shape at (249, 177) with radius 78.
; PLAN: r0=249(x), r1=177(y), r2=78(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 249
LDI r1, 177
LDI r2, 78
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
