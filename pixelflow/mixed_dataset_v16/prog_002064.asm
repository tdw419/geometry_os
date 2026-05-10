; DESCRIPTION: Composite: Places a white dot at position (408, 77) then Renders a blue line between points (460, 222) and (110, 118) then Draws a orange circle centered at (243, 173) with radius 30.
; PLAN: r0=408(x), r1=77(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=460(x1), r6=222(y1), r7=110(x2), r8=118(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=243(x), r11=173(y), r12=30(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 408
LDI r1, 77
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 460
LDI r6, 222
LDI r7, 110
LDI r8, 118
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 243
LDI r11, 173
LDI r12, 30
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
