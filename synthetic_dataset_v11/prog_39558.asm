; DESCRIPTION: Places a green circle of radius 57 at center (170, 115).
; PLAN: r0=170(x), r1=115(y), r2=57(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 115
LDI r2, 57
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
