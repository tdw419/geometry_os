; DESCRIPTION: Creates a orange circular shape at (389, 92) with radius 46.
; PLAN: r0=389(x), r1=92(y), r2=46(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 389
LDI r1, 92
LDI r2, 46
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
