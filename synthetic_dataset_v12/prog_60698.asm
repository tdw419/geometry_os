; DESCRIPTION: Places a green circle of radius 53 at center (275, 89).
; PLAN: r0=275(x), r1=89(y), r2=53(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 275
LDI r1, 89
LDI r2, 53
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
