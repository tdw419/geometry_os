; DESCRIPTION: Places a orange disk with center (107, 79) and radius 52.
; PLAN: r0=107(x), r1=79(y), r2=52(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 107
LDI r1, 79
LDI r2, 52
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
