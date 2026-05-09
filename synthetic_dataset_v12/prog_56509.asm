; DESCRIPTION: Places a orange circle of radius 44 at center (220, 84).
; PLAN: r0=220(x), r1=84(y), r2=44(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 220
LDI r1, 84
LDI r2, 44
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
