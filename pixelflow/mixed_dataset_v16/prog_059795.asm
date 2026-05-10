; DESCRIPTION: Places a orange circle of radius 48 at center (309, 188).
; PLAN: r0=309(x), r1=188(y), r2=48(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 309
LDI r1, 188
LDI r2, 48
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
