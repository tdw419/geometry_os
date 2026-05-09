; DESCRIPTION: Composite: . Then Sets a single black pixel at (164, 14). Then Places a white circle of radius 48 at center (93, 88).
; PLAN: r0=164(x), r1=14(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=93(x), r1=88(y), r2=48(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single black pixel at (164, 14).
; PLAN: r0=164(x), r1=14(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 164
LDI r1, 14
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Places a white circle of radius 48 at center (93, 88).
; PLAN: r0=93(x), r1=88(y), r2=48(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 93
LDI r1, 88
LDI r2, 48
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
