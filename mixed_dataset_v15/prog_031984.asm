; DESCRIPTION: Places a white circle of radius 51 at center (417, 65).
; PLAN: r0=417(x), r1=65(y), r2=51(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 417
LDI r1, 65
LDI r2, 51
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
