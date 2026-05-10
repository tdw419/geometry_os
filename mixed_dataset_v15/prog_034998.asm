; DESCRIPTION: Composite: Draws a blue circle centered at (132, 169) with radius 11 then Sets a single blue pixel at (243, 33).
; PLAN: r0=132(x), r1=169(y), r2=11(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=243(x), r6=33(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 132
LDI r1, 169
LDI r2, 11
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 243
LDI r6, 33
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
