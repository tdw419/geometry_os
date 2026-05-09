; DESCRIPTION: Composite: Sets a single orange pixel at (360, 59) then Draws a magenta line from (69, 127) to (260, 12) then Creates a yellow rectangular region at (247, 203) spanning 49 by 11 pixels.
; PLAN: r0=360(x), r1=59(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=69(x1), r6=127(y1), r7=260(x2), r8=12(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=247(x), r11=203(y), r12=49(width), r13=11(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 360
LDI r1, 59
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 69
LDI r6, 127
LDI r7, 260
LDI r8, 12
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 247
LDI r11, 203
LDI r12, 49
LDI r13, 11
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
