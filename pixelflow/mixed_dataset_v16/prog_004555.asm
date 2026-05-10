; DESCRIPTION: Composite: Draws a red circle centered at (159, 140) with radius 75 then Places a yellow dot at position (206, 99).
; PLAN: r0=159(x), r1=140(y), r2=75(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=206(x), r6=99(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 159
LDI r1, 140
LDI r2, 75
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 206
LDI r6, 99
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
