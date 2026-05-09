; DESCRIPTION: Composite: . Then Places a blue dot at position (72, 115). Then Draws a blue circle centered at (104, 190) with radius 19.
; PLAN: r0=72(x), r1=115(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=104(x), r1=190(y), r2=19(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a blue dot at position (72, 115).
; PLAN: r0=72(x), r1=115(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 72
LDI r1, 115
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Draws a blue circle centered at (104, 190) with radius 19.
; PLAN: r0=104(x), r1=190(y), r2=19(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 190
LDI r2, 19
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
