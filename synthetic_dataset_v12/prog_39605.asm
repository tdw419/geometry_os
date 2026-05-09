; DESCRIPTION: Places a white circle of radius 14 at center (444, 142).
; PLAN: r0=444(x), r1=142(y), r2=14(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 444
LDI r1, 142
LDI r2, 14
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
