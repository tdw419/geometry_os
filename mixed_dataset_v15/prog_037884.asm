; DESCRIPTION: Composite: Renders a cyan line between points (167, 180) and (250, 45) then Sets a single blue pixel at (294, 245) then Draws a purple circle centered at (176, 151) with radius 61.
; PLAN: r0=167(x1), r1=180(y1), r2=250(x2), r3=45(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=294(x), r6=245(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=176(x), r11=151(y), r12=61(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 167
LDI r1, 180
LDI r2, 250
LDI r3, 45
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 294
LDI r6, 245
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 176
LDI r11, 151
LDI r12, 61
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
