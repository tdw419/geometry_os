; DESCRIPTION: Places a white circle of radius 33 at center (408, 214).
; PLAN: r0=408(x), r1=214(y), r2=33(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 408
LDI r1, 214
LDI r2, 33
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
