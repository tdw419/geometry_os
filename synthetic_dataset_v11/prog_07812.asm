; DESCRIPTION: Composite: . Then Sets a single black pixel at (133, 195). Then Draws a red circle centered at (160, 148) with radius 75.
; PLAN: r0=133(x), r1=195(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=160(x), r1=148(y), r2=75(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single black pixel at (133, 195).
; PLAN: r0=133(x), r1=195(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 133
LDI r1, 195
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Draws a red circle centered at (160, 148) with radius 75.
; PLAN: r0=160(x), r1=148(y), r2=75(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 160
LDI r1, 148
LDI r2, 75
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
