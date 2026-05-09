; DESCRIPTION: Places a orange circle of radius 30 at center (250, 166).
; PLAN: r0=250(x), r1=166(y), r2=30(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 250
LDI r1, 166
LDI r2, 30
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
