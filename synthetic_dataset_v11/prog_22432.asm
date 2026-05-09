; DESCRIPTION: Places a green circle of radius 12 at center (47, 108).
; PLAN: r0=47(x), r1=108(y), r2=12(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 47
LDI r1, 108
LDI r2, 12
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
