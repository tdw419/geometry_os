; DESCRIPTION: Composite: Draws a blue circle centered at (317, 160) with radius 63 then Places a green dot at position (286, 45).
; PLAN: r0=317(x), r1=160(y), r2=63(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=286(x), r6=45(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 317
LDI r1, 160
LDI r2, 63
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 286
LDI r6, 45
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
