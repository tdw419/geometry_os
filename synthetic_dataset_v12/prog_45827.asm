; DESCRIPTION: Composite: Renders a blue line between points (376, 99) and (475, 31) then Places a white circle of radius 28 at center (458, 141) then Sets a single orange pixel at (226, 4).
; PLAN: r0=376(x1), r1=99(y1), r2=475(x2), r3=31(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=458(x), r6=141(y), r7=28(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=226(x), r11=4(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 376
LDI r1, 99
LDI r2, 475
LDI r3, 31
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 458
LDI r6, 141
LDI r7, 28
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 226
LDI r11, 4
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
