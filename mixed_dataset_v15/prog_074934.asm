; DESCRIPTION: Creates a yellow circular shape at (456, 147) with radius 27.
; PLAN: r0=456(x), r1=147(y), r2=27(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 456
LDI r1, 147
LDI r2, 27
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
