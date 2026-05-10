; DESCRIPTION: Composite: Draws a orange circle centered at (308, 130) with radius 72 then Draws a black line from (238, 76) to (177, 255) then Sets a single orange pixel at (293, 118).
; PLAN: r0=308(x), r1=130(y), r2=72(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=238(x1), r6=76(y1), r7=177(x2), r8=255(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=293(x), r11=118(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 308
LDI r1, 130
LDI r2, 72
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 238
LDI r6, 76
LDI r7, 177
LDI r8, 255
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 293
LDI r11, 118
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
