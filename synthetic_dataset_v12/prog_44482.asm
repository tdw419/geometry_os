; DESCRIPTION: Places a orange circle of radius 33 at center (70, 163).
; PLAN: r0=70(x), r1=163(y), r2=33(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 163
LDI r2, 33
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
