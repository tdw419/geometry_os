; DESCRIPTION: Composite: Draws a red circle centered at (412, 136) with radius 33 then Sets a single green pixel at (3, 243).
; PLAN: r0=412(x), r1=136(y), r2=33(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=3(x), r6=243(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 412
LDI r1, 136
LDI r2, 33
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 3
LDI r6, 243
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
