; DESCRIPTION: Places a green circle of radius 75 at center (115, 125).
; PLAN: r0=115(x), r1=125(y), r2=75(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 125
LDI r2, 75
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
