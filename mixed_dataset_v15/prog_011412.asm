; DESCRIPTION: Composite: Draws a yellow circle centered at (364, 142) with radius 76 then Sets a single magenta pixel at (220, 156).
; PLAN: r0=364(x), r1=142(y), r2=76(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=220(x), r6=156(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 364
LDI r1, 142
LDI r2, 76
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 220
LDI r6, 156
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
