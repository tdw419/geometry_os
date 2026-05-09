; DESCRIPTION: Places a orange circle of radius 19 at center (132, 237).
; PLAN: r0=132(x), r1=237(y), r2=19(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 132
LDI r1, 237
LDI r2, 19
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
