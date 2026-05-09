; DESCRIPTION: Places a white circle of radius 25 at center (77, 174).
; PLAN: r0=77(x), r1=174(y), r2=25(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 174
LDI r2, 25
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
