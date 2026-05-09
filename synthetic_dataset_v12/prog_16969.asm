; DESCRIPTION: Places a white circle of radius 62 at center (411, 91).
; PLAN: r0=411(x), r1=91(y), r2=62(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 411
LDI r1, 91
LDI r2, 62
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
