; DESCRIPTION: Places a white disk with center (59, 174) and radius 35.
; PLAN: r0=59(x), r1=174(y), r2=35(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 174
LDI r2, 35
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
