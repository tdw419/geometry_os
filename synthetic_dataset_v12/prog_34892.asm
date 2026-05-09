; DESCRIPTION: Places a orange circle of radius 75 at center (255, 79).
; PLAN: r0=255(x), r1=79(y), r2=75(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 255
LDI r1, 79
LDI r2, 75
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
