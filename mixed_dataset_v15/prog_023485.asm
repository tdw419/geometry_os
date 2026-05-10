; DESCRIPTION: Composite: Places a white circle of radius 55 at center (60, 105) then Sets a single white pixel at (433, 165).
; PLAN: r0=60(x), r1=105(y), r2=55(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=433(x), r6=165(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 60
LDI r1, 105
LDI r2, 55
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 433
LDI r6, 165
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
