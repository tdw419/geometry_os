; DESCRIPTION: Composite: Places a orange dot at position (433, 131) then Draws a blue line from (222, 198) to (19, 3) then Creates a orange circular shape at (177, 166) with radius 55.
; PLAN: r0=433(x), r1=131(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=222(x1), r6=198(y1), r7=19(x2), r8=3(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=177(x), r11=166(y), r12=55(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 433
LDI r1, 131
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 222
LDI r6, 198
LDI r7, 19
LDI r8, 3
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 177
LDI r11, 166
LDI r12, 55
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
