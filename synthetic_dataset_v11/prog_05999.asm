; DESCRIPTION: Places a orange circle of radius 79 at center (82, 161).
; PLAN: r0=82(x), r1=161(y), r2=79(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 161
LDI r2, 79
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
