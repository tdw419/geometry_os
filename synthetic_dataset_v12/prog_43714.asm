; DESCRIPTION: Composite: Creates a magenta rectangular region at (25, 115) spanning 63 by 104 pixels then Places a blue line segment connecting (278, 36) to (107, 43) then Sets a single black pixel at (183, 180).
; PLAN: r0=25(x), r1=115(y), r2=63(width), r3=104(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=278(x1), r6=36(y1), r7=107(x2), r8=43(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=183(x), r11=180(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 25
LDI r1, 115
LDI r2, 63
LDI r3, 104
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 278
LDI r6, 36
LDI r7, 107
LDI r8, 43
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 183
LDI r11, 180
LDI r12, 0x000000
PSET r10, r11, r12
HALT
