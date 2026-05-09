; DESCRIPTION: Places a white circle of radius 47 at center (78, 91).
; PLAN: r0=78(x), r1=91(y), r2=47(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 78
LDI r1, 91
LDI r2, 47
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
