; DESCRIPTION: Composite: Draws a blue circle centered at (264, 155) with radius 54 then Places a orange dot at position (20, 133).
; PLAN: r0=264(x), r1=155(y), r2=54(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=20(x), r6=133(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 264
LDI r1, 155
LDI r2, 54
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 20
LDI r6, 133
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
