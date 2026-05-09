; DESCRIPTION: Places a white circle of radius 46 at center (109, 142).
; PLAN: r0=109(x), r1=142(y), r2=46(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 142
LDI r2, 46
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
