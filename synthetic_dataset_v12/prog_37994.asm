; DESCRIPTION: Places a orange circle of radius 35 at center (459, 141).
; PLAN: r0=459(x), r1=141(y), r2=35(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 459
LDI r1, 141
LDI r2, 35
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
