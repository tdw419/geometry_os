; DESCRIPTION: Creates a green circular shape at (301, 84) with radius 79.
; PLAN: r0=301(x), r1=84(y), r2=79(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 301
LDI r1, 84
LDI r2, 79
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
