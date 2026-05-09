; DESCRIPTION: Composite: Draws a orange circle centered at (385, 135) with radius 45 then Sets a single red pixel at (101, 244).
; PLAN: r0=385(x), r1=135(y), r2=45(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=101(x), r6=244(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 385
LDI r1, 135
LDI r2, 45
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 101
LDI r6, 244
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
