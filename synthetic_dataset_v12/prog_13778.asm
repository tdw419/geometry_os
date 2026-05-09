; DESCRIPTION: Places a orange circle of radius 77 at center (301, 90).
; PLAN: r0=301(x), r1=90(y), r2=77(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 301
LDI r1, 90
LDI r2, 77
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
