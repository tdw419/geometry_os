; DESCRIPTION: Places a orange circle of radius 79 at center (164, 83).
; PLAN: r0=164(x), r1=83(y), r2=79(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 83
LDI r2, 79
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
