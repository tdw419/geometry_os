; DESCRIPTION: Composite: Draws a blue circle centered at (396, 101) with radius 56 then Places a yellow dot at position (487, 160).
; PLAN: r0=396(x), r1=101(y), r2=56(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=487(x), r6=160(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 396
LDI r1, 101
LDI r2, 56
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 487
LDI r6, 160
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
