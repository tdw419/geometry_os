; DESCRIPTION: Composite: . Then Places a white circle of radius 29 at center (211, 109). Then Places a white dot at position (55, 188).
; PLAN: r0=211(x), r1=109(y), r2=29(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=55(x), r1=188(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a white circle of radius 29 at center (211, 109).
; PLAN: r0=211(x), r1=109(y), r2=29(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 211
LDI r1, 109
LDI r2, 29
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a white dot at position (55, 188).
; PLAN: r0=55(x), r1=188(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 55
LDI r1, 188
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
