; DESCRIPTION: Creates a yellow circular shape at (431, 120) with radius 36.
; PLAN: r0=431(x), r1=120(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 431
LDI r1, 120
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
