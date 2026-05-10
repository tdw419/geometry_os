; DESCRIPTION: Creates a yellow circular shape at (330, 92) with radius 79.
; PLAN: r0=330(x), r1=92(y), r2=79(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 330
LDI r1, 92
LDI r2, 79
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
