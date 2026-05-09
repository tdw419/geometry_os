; DESCRIPTION: Places a white circle of radius 66 at center (267, 181).
; PLAN: r0=267(x), r1=181(y), r2=66(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 267
LDI r1, 181
LDI r2, 66
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
