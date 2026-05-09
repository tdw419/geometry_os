; DESCRIPTION: Creates a yellow circular shape at (106, 82) with radius 58.
; PLAN: r0=106(x), r1=82(y), r2=58(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 106
LDI r1, 82
LDI r2, 58
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
