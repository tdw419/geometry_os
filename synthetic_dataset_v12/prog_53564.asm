; DESCRIPTION: Places a white circle of radius 54 at center (66, 57).
; PLAN: r0=66(x), r1=57(y), r2=54(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 66
LDI r1, 57
LDI r2, 54
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
