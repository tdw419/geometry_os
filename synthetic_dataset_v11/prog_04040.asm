; DESCRIPTION: Places a orange circle of radius 79 at center (143, 174).
; PLAN: r0=143(x), r1=174(y), r2=79(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 143
LDI r1, 174
LDI r2, 79
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
