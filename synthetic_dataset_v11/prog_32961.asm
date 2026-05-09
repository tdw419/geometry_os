; DESCRIPTION: Places a orange circle of radius 58 at center (165, 65).
; PLAN: r0=165(x), r1=65(y), r2=58(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 65
LDI r2, 58
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
