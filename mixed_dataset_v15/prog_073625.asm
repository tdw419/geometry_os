; DESCRIPTION: Composite: Creates a magenta circular shape at (119, 100) with radius 75 then Creates a purple rectangular region at (281, 84) spanning 88 by 27 pixels then Sets a single purple pixel at (95, 169).
; PLAN: r0=119(x), r1=100(y), r2=75(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=281(x), r6=84(y), r7=88(width), r8=27(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=95(x), r11=169(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 119
LDI r1, 100
LDI r2, 75
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 281
LDI r6, 84
LDI r7, 88
LDI r8, 27
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 95
LDI r11, 169
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
