; DESCRIPTION: Composite: Draws a purple circle centered at (232, 123) with radius 48 then Places a red dot at position (249, 236).
; PLAN: r0=232(x), r1=123(y), r2=48(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=249(x), r6=236(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 232
LDI r1, 123
LDI r2, 48
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 249
LDI r6, 236
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
