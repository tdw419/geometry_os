; DESCRIPTION: Places a orange circle of radius 33 at center (39, 169).
; PLAN: r0=39(x), r1=169(y), r2=33(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 39
LDI r1, 169
LDI r2, 33
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
