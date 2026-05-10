; DESCRIPTION: Places a orange disk with center (292, 152) and radius 65.
; PLAN: r0=292(x), r1=152(y), r2=65(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 292
LDI r1, 152
LDI r2, 65
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
