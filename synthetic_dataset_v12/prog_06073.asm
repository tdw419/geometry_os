; DESCRIPTION: Composite: Draws a green circle centered at (148, 102) with radius 56 then Places a orange dot at position (135, 216).
; PLAN: r0=148(x), r1=102(y), r2=56(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=135(x), r6=216(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 148
LDI r1, 102
LDI r2, 56
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 135
LDI r6, 216
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
