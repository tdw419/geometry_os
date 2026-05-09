; DESCRIPTION: Composite: Places a red line segment connecting (68, 109) to (340, 166) then Creates a green rectangular region at (436, 43) spanning 70 by 70 pixels then Places a purple dot at position (133, 154).
; PLAN: r0=68(x1), r1=109(y1), r2=340(x2), r3=166(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=436(x), r6=43(y), r7=70(width), r8=70(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=133(x), r11=154(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 68
LDI r1, 109
LDI r2, 340
LDI r3, 166
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 436
LDI r6, 43
LDI r7, 70
LDI r8, 70
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 133
LDI r11, 154
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
