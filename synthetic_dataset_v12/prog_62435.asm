; DESCRIPTION: Places a orange circle of radius 77 at center (181, 120).
; PLAN: r0=181(x), r1=120(y), r2=77(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 181
LDI r1, 120
LDI r2, 77
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
