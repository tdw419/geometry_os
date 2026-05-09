; DESCRIPTION: Composite: . Then Places a black dot at position (29, 174). Then Places a white circle of radius 17 at center (189, 142).
; PLAN: r0=29(x), r1=174(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=189(x), r1=142(y), r2=17(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a black dot at position (29, 174).
; PLAN: r0=29(x), r1=174(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 29
LDI r1, 174
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Places a white circle of radius 17 at center (189, 142).
; PLAN: r0=189(x), r1=142(y), r2=17(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 189
LDI r1, 142
LDI r2, 17
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
