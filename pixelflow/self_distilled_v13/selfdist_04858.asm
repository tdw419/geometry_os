; DESCRIPTION: Places a orange disk with center (216, 188) and radius 43.
; PLAN: r0=216(x), r1=188(y), r2=43(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 188
LDI r2, 43
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
