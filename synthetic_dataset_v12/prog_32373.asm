; DESCRIPTION: Composite: Places a orange dot at position (375, 175) then Draws a cyan line from (219, 58) to (253, 99) then Draws a blue circle centered at (250, 125) with radius 80.
; PLAN: r0=375(x), r1=175(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=219(x1), r6=58(y1), r7=253(x2), r8=99(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=250(x), r11=125(y), r12=80(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 375
LDI r1, 175
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 219
LDI r6, 58
LDI r7, 253
LDI r8, 99
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 250
LDI r11, 125
LDI r12, 80
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
