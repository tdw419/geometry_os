; DESCRIPTION: Places a white disk with center (39, 141) and radius 15.
; PLAN: r0=39(x), r1=141(y), r2=15(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 39
LDI r1, 141
LDI r2, 15
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
