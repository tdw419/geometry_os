; DESCRIPTION: Composite: Draws a blue circle centered at (392, 106) with radius 39 then Sets a single magenta pixel at (133, 62).
; PLAN: r0=392(x), r1=106(y), r2=39(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=133(x), r6=62(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 392
LDI r1, 106
LDI r2, 39
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 133
LDI r6, 62
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
