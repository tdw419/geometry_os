; DESCRIPTION: Places a orange circle of radius 70 at center (115, 115).
; PLAN: r0=115(x), r1=115(y), r2=70(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 115
LDI r2, 70
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
