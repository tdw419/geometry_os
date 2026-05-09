; DESCRIPTION: Composite: Places a white dot at position (1, 227) then Draws a yellow line from (195, 194) to (270, 160) then Creates a orange rectangular region at (317, 111) spanning 15 by 106 pixels.
; PLAN: r0=1(x), r1=227(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=195(x1), r6=194(y1), r7=270(x2), r8=160(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=317(x), r11=111(y), r12=15(width), r13=106(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 1
LDI r1, 227
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 195
LDI r6, 194
LDI r7, 270
LDI r8, 160
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 317
LDI r11, 111
LDI r12, 15
LDI r13, 106
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
