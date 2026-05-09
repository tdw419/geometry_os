; DESCRIPTION: Places a white circle of radius 80 at center (380, 145).
; PLAN: r0=380(x), r1=145(y), r2=80(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 380
LDI r1, 145
LDI r2, 80
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
