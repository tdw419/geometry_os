; DESCRIPTION: Places a white disk with center (39, 26) and radius 51.
; PLAN: r0=39(x), r1=26(y), r2=51(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 39
LDI r1, 26
LDI r2, 51
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
