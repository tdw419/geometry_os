; DESCRIPTION: Composite: Draws a yellow circle centered at (389, 160) with radius 77 then Places a blue dot at position (244, 163).
; PLAN: r0=389(x), r1=160(y), r2=77(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=244(x), r6=163(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 389
LDI r1, 160
LDI r2, 77
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 244
LDI r6, 163
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
