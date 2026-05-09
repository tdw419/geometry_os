; DESCRIPTION: Places a orange circle of radius 28 at center (188, 47).
; PLAN: r0=188(x), r1=47(y), r2=28(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 47
LDI r2, 28
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
