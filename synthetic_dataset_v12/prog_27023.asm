; DESCRIPTION: Places a orange circle of radius 55 at center (84, 162).
; PLAN: r0=84(x), r1=162(y), r2=55(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 162
LDI r2, 55
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
