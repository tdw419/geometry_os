; DESCRIPTION: Places a white circle of radius 29 at center (476, 91).
; PLAN: r0=476(x), r1=91(y), r2=29(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 476
LDI r1, 91
LDI r2, 29
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
