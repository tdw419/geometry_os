; DESCRIPTION: Creates a yellow circular shape at (142, 127) with radius 68.
; PLAN: r0=142(x), r1=127(y), r2=68(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 127
LDI r2, 68
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
