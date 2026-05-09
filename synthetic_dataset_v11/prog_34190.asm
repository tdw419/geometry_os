; DESCRIPTION: Places a green circle of radius 70 at center (77, 112).
; PLAN: r0=77(x), r1=112(y), r2=70(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 112
LDI r2, 70
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
