; DESCRIPTION: Creates a yellow circular shape at (328, 217) with radius 37.
; PLAN: r0=328(x), r1=217(y), r2=37(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 328
LDI r1, 217
LDI r2, 37
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
