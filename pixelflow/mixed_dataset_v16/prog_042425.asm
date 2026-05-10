; DESCRIPTION: Places a green circle of radius 70 at center (140, 122).
; PLAN: r0=140(x), r1=122(y), r2=70(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 122
LDI r2, 70
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
