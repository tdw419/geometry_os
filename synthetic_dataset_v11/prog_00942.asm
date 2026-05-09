; DESCRIPTION: Creates a yellow circular shape at (84, 104) with radius 71.
; PLAN: r0=84(x), r1=104(y), r2=71(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 104
LDI r2, 71
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
