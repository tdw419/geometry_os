; DESCRIPTION: Places a orange circle of radius 43 at center (81, 169).
; PLAN: r0=81(x), r1=169(y), r2=43(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 169
LDI r2, 43
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
