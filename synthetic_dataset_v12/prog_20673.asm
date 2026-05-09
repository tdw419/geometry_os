; DESCRIPTION: Composite: Places a yellow circle of radius 57 at center (449, 95) then Creates a blue rectangular region at (183, 139) spanning 117 by 57 pixels then Sets a single yellow pixel at (428, 138).
; PLAN: r0=449(x), r1=95(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=183(x), r6=139(y), r7=117(width), r8=57(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=428(x), r11=138(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 449
LDI r1, 95
LDI r2, 57
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 183
LDI r6, 139
LDI r7, 117
LDI r8, 57
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 428
LDI r11, 138
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
