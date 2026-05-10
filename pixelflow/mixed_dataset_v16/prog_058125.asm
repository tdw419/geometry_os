; DESCRIPTION: Creates a yellow circular shape at (426, 117) with radius 79.
; PLAN: r0=426(x), r1=117(y), r2=79(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 426
LDI r1, 117
LDI r2, 79
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
