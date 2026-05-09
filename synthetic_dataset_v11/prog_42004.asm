; DESCRIPTION: Places a white circle of radius 60 at center (132, 66).
; PLAN: r0=132(x), r1=66(y), r2=60(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 132
LDI r1, 66
LDI r2, 60
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
