; DESCRIPTION: Places a orange disk with center (188, 152) and radius 23.
; PLAN: r0=188(x), r1=152(y), r2=23(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 152
LDI r2, 23
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
