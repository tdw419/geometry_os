; DESCRIPTION: Composite: . Then Places a white circle of radius 46 at center (74, 50). Then Places a red dot at position (136, 94).
; PLAN: r0=74(x), r1=50(y), r2=46(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=136(x), r1=94(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a white circle of radius 46 at center (74, 50).
; PLAN: r0=74(x), r1=50(y), r2=46(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 50
LDI r2, 46
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a red dot at position (136, 94).
; PLAN: r0=136(x), r1=94(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 136
LDI r1, 94
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
