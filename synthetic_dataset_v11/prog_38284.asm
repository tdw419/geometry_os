; DESCRIPTION: Composite: . Then Places a white circle of radius 37 at center (57, 70). Then Places a black dot at position (40, 121).
; PLAN: r0=57(x), r1=70(y), r2=37(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=40(x), r1=121(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a white circle of radius 37 at center (57, 70).
; PLAN: r0=57(x), r1=70(y), r2=37(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 57
LDI r1, 70
LDI r2, 37
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a black dot at position (40, 121).
; PLAN: r0=40(x), r1=121(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 40
LDI r1, 121
LDI r2, 0x000000
PSET r0, r1, r2
HALT
