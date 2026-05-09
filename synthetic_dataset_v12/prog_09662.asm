; DESCRIPTION: Composite: Sets a single red pixel at (10, 143) then Creates a orange rectangular region at (156, 157) spanning 24 by 63 pixels then Renders a yellow line between points (143, 178) and (195, 88).
; PLAN: r0=10(x), r1=143(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=156(x), r6=157(y), r7=24(width), r8=63(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=143(x1), r11=178(y1), r12=195(x2), r13=88(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 10
LDI r1, 143
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 156
LDI r6, 157
LDI r7, 24
LDI r8, 63
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 143
LDI r11, 178
LDI r12, 195
LDI r13, 88
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
