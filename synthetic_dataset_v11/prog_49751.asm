; DESCRIPTION: Composite: . Then Sets a single black pixel at (118, 75). Then Draws a yellow circle centered at (138, 76) with radius 47.
; PLAN: r0=118(x), r1=75(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=138(x), r1=76(y), r2=47(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single black pixel at (118, 75).
; PLAN: r0=118(x), r1=75(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 118
LDI r1, 75
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Draws a yellow circle centered at (138, 76) with radius 47.
; PLAN: r0=138(x), r1=76(y), r2=47(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 76
LDI r2, 47
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
