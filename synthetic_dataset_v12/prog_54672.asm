; DESCRIPTION: Creates a yellow circular shape at (147, 149) with radius 55.
; PLAN: r0=147(x), r1=149(y), r2=55(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 149
LDI r2, 55
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
