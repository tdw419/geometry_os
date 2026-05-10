; DESCRIPTION: Composite: Sets a single orange pixel at (190, 251) then Places a green 77x84 rectangle at position (159, 80) then Places a black line segment connecting (179, 25) to (178, 127).
; PLAN: r0=190(x), r1=251(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=159(x), r6=80(y), r7=77(width), r8=84(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=179(x1), r11=25(y1), r12=178(x2), r13=127(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 190
LDI r1, 251
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 159
LDI r6, 80
LDI r7, 77
LDI r8, 84
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 179
LDI r11, 25
LDI r12, 178
LDI r13, 127
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
