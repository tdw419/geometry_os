; DESCRIPTION: Places a white circle of radius 55 at center (309, 175).
; PLAN: r0=309(x), r1=175(y), r2=55(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 309
LDI r1, 175
LDI r2, 55
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
