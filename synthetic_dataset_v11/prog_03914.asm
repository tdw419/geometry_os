; DESCRIPTION: Creates a yellow circular shape at (152, 121) with radius 29.
; PLAN: r0=152(x), r1=121(y), r2=29(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 152
LDI r1, 121
LDI r2, 29
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
