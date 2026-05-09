; DESCRIPTION: Places a green circle of radius 76 at center (220, 77).
; PLAN: r0=220(x), r1=77(y), r2=76(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 220
LDI r1, 77
LDI r2, 76
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
