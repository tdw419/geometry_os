; DESCRIPTION: Composite: Draws a cyan circle centered at (450, 169) with radius 41 then Creates a white rectangular region at (4, 0) spanning 31 by 101 pixels then Sets a single purple pixel at (510, 100).
; PLAN: r0=450(x), r1=169(y), r2=41(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=4(x), r6=0(y), r7=31(width), r8=101(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=510(x), r11=100(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 450
LDI r1, 169
LDI r2, 41
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 4
LDI r6, 0
LDI r7, 31
LDI r8, 101
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 510
LDI r11, 100
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
