; DESCRIPTION: Composite: Creates a orange rectangular region at (340, 95) spanning 14 by 115 pixels then Places a orange line segment connecting (407, 250) to (235, 26) then Sets a single purple pixel at (440, 44).
; PLAN: r0=340(x), r1=95(y), r2=14(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=407(x1), r6=250(y1), r7=235(x2), r8=26(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=440(x), r11=44(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 340
LDI r1, 95
LDI r2, 14
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 407
LDI r6, 250
LDI r7, 235
LDI r8, 26
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 440
LDI r11, 44
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
