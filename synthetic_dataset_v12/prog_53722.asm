; DESCRIPTION: Composite: Sets a single blue pixel at (226, 183) then Renders a green line between points (475, 9) and (428, 42) then Draws a orange circle centered at (72, 73) with radius 30.
; PLAN: r0=226(x), r1=183(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=475(x1), r6=9(y1), r7=428(x2), r8=42(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=72(x), r11=73(y), r12=30(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 226
LDI r1, 183
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 475
LDI r6, 9
LDI r7, 428
LDI r8, 42
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 72
LDI r11, 73
LDI r12, 30
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
