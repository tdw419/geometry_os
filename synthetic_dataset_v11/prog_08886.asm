; DESCRIPTION: Creates a yellow circular shape at (118, 149) with radius 59.
; PLAN: r0=118(x), r1=149(y), r2=59(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 149
LDI r2, 59
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
