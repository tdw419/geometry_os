; DESCRIPTION: Places a orange disk with center (222, 44) and radius 50.
; PLAN: r0=222(x), r1=44(y), r2=50(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 222
LDI r1, 44
LDI r2, 50
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
