; DESCRIPTION: Composite: Places a blue dot at position (324, 112) then Draws a purple circle centered at (428, 162) with radius 78.
; PLAN: r0=324(x), r1=112(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=428(x), r6=162(y), r7=78(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 324
LDI r1, 112
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 428
LDI r6, 162
LDI r7, 78
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
