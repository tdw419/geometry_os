; DESCRIPTION: Composite: Places a cyan circle of radius 36 at center (84, 119) then Creates a purple rectangular region at (369, 11) spanning 98 by 108 pixels then Sets a single black pixel at (183, 36).
; PLAN: r0=84(x), r1=119(y), r2=36(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=369(x), r6=11(y), r7=98(width), r8=108(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=183(x), r11=36(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 84
LDI r1, 119
LDI r2, 36
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 369
LDI r6, 11
LDI r7, 98
LDI r8, 108
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 183
LDI r11, 36
LDI r12, 0x000000
PSET r10, r11, r12
HALT
