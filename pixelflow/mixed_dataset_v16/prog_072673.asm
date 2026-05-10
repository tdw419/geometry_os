; DESCRIPTION: Composite: Places a magenta line segment connecting (277, 26) to (264, 77) then Places a orange dot at position (0, 238) then Creates a purple rectangular region at (311, 96) spanning 16 by 114 pixels.
; PLAN: r0=277(x1), r1=26(y1), r2=264(x2), r3=77(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=0(x), r6=238(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=311(x), r11=96(y), r12=16(width), r13=114(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 277
LDI r1, 26
LDI r2, 264
LDI r3, 77
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 0
LDI r6, 238
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 311
LDI r11, 96
LDI r12, 16
LDI r13, 114
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
