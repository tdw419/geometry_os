; DESCRIPTION: Creates a green circular shape at (389, 181) with radius 18.
; PLAN: r0=389(x), r1=181(y), r2=18(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 389
LDI r1, 181
LDI r2, 18
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
