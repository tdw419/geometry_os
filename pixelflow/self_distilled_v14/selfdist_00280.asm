; DESCRIPTION: Places a white disk with center (125, 47) and radius 48.
; PLAN: r0=125(x), r1=47(y), r2=48(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 125
LDI r1, 47
LDI r2, 48
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
