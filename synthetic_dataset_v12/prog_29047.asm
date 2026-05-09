; DESCRIPTION: Composite: Places a purple circle of radius 41 at center (89, 102) then Creates a magenta rectangular region at (85, 28) spanning 42 by 106 pixels then Sets a single blue pixel at (320, 162).
; PLAN: r0=89(x), r1=102(y), r2=41(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=85(x), r6=28(y), r7=42(width), r8=106(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=320(x), r11=162(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 89
LDI r1, 102
LDI r2, 41
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 85
LDI r6, 28
LDI r7, 42
LDI r8, 106
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 320
LDI r11, 162
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
