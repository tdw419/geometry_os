; DESCRIPTION: Creates a orange circular shape at (347, 46) with radius 11.
; PLAN: r0=347(x), r1=46(y), r2=11(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 347
LDI r1, 46
LDI r2, 11
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
