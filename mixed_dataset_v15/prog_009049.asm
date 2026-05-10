; DESCRIPTION: Composite: Draws a cyan circle centered at (244, 213) with radius 33 then Sets a single green pixel at (136, 203).
; PLAN: r0=244(x), r1=213(y), r2=33(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=136(x), r6=203(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 244
LDI r1, 213
LDI r2, 33
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 136
LDI r6, 203
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
