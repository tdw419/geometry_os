; DESCRIPTION: Composite: Places a magenta dot at position (87, 137) then Creates a yellow rectangular region at (360, 5) spanning 58 by 74 pixels then Draws a blue line from (229, 11) to (233, 181).
; PLAN: r0=87(x), r1=137(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=360(x), r6=5(y), r7=58(width), r8=74(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=229(x1), r11=11(y1), r12=233(x2), r13=181(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 87
LDI r1, 137
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 360
LDI r6, 5
LDI r7, 58
LDI r8, 74
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 229
LDI r11, 11
LDI r12, 233
LDI r13, 181
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
