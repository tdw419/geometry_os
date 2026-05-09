; DESCRIPTION: Composite: Places a red dot at position (486, 72) then Places a blue line segment connecting (390, 26) to (209, 253) then Draws a orange circle centered at (379, 127) with radius 36.
; PLAN: r0=486(x), r1=72(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=390(x1), r6=26(y1), r7=209(x2), r8=253(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=379(x), r11=127(y), r12=36(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 486
LDI r1, 72
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 390
LDI r6, 26
LDI r7, 209
LDI r8, 253
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 379
LDI r11, 127
LDI r12, 36
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
