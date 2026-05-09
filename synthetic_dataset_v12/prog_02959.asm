; DESCRIPTION: Composite: Sets a single green pixel at (162, 65) then Places a black line segment connecting (427, 187) to (148, 222) then Creates a magenta rectangular region at (311, 42) spanning 95 by 74 pixels.
; PLAN: r0=162(x), r1=65(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=427(x1), r6=187(y1), r7=148(x2), r8=222(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=311(x), r11=42(y), r12=95(width), r13=74(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 162
LDI r1, 65
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 427
LDI r6, 187
LDI r7, 148
LDI r8, 222
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 311
LDI r11, 42
LDI r12, 95
LDI r13, 74
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
