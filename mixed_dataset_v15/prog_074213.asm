; DESCRIPTION: Creates a yellow circular shape at (79, 131) with radius 17.
; PLAN: r0=79(x), r1=131(y), r2=17(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 131
LDI r2, 17
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
