; DESCRIPTION: Composite: Places a yellow dot at position (176, 63) then Draws a blue circle centered at (325, 78) with radius 72.
; PLAN: r0=176(x), r1=63(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=325(x), r6=78(y), r7=72(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 176
LDI r1, 63
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 325
LDI r6, 78
LDI r7, 72
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
