; DESCRIPTION: Places a orange circle of radius 46 at center (241, 152).
; PLAN: r0=241(x), r1=152(y), r2=46(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 241
LDI r1, 152
LDI r2, 46
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
