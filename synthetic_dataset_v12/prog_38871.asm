; DESCRIPTION: Composite: Places a orange circle of radius 21 at center (483, 170) then Creates a blue rectangular region at (75, 32) spanning 95 by 109 pixels then Places a blue dot at position (200, 105).
; PLAN: r0=483(x), r1=170(y), r2=21(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=75(x), r6=32(y), r7=95(width), r8=109(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=200(x), r11=105(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 483
LDI r1, 170
LDI r2, 21
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 75
LDI r6, 32
LDI r7, 95
LDI r8, 109
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 200
LDI r11, 105
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
