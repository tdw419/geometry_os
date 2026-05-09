; DESCRIPTION: Places a green circle of radius 56 at center (223, 70).
; PLAN: r0=223(x), r1=70(y), r2=56(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 223
LDI r1, 70
LDI r2, 56
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
