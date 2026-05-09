; DESCRIPTION: Composite: Places a black dot at position (349, 150) then Creates a green rectangular region at (3, 8) spanning 43 by 107 pixels then Draws a orange line from (280, 75) to (152, 199).
; PLAN: r0=349(x), r1=150(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=3(x), r6=8(y), r7=43(width), r8=107(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=280(x1), r11=75(y1), r12=152(x2), r13=199(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 349
LDI r1, 150
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 3
LDI r6, 8
LDI r7, 43
LDI r8, 107
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 280
LDI r11, 75
LDI r12, 152
LDI r13, 199
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
