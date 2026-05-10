; DESCRIPTION: Composite: Sets a single purple pixel at (369, 167) then Draws a orange line from (255, 178) to (251, 165) then Creates a green circular shape at (90, 167) with radius 12.
; PLAN: r0=369(x), r1=167(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=255(x1), r6=178(y1), r7=251(x2), r8=165(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=90(x), r11=167(y), r12=12(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 369
LDI r1, 167
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 255
LDI r6, 178
LDI r7, 251
LDI r8, 165
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 90
LDI r11, 167
LDI r12, 12
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
