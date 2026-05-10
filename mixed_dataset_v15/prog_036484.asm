; DESCRIPTION: Places a orange circle of radius 33 at center (288, 141).
; PLAN: r0=288(x), r1=141(y), r2=33(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 288
LDI r1, 141
LDI r2, 33
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
