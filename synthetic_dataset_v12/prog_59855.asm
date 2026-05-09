; DESCRIPTION: Places a orange circle of radius 79 at center (400, 107).
; PLAN: r0=400(x), r1=107(y), r2=79(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 400
LDI r1, 107
LDI r2, 79
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
