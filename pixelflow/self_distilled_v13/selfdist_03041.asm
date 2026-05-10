; DESCRIPTION: Places a white disk with center (216, 176) and radius 63.
; PLAN: r0=216(x), r1=176(y), r2=63(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 176
LDI r2, 63
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
