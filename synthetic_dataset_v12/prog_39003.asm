; DESCRIPTION: Composite: Places a blue dot at position (146, 217) then Creates a purple rectangular region at (194, 28) spanning 12 by 65 pixels then Places a orange line segment connecting (53, 205) to (476, 221).
; PLAN: r0=146(x), r1=217(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=194(x), r6=28(y), r7=12(width), r8=65(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=53(x1), r11=205(y1), r12=476(x2), r13=221(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 146
LDI r1, 217
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 194
LDI r6, 28
LDI r7, 12
LDI r8, 65
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 53
LDI r11, 205
LDI r12, 476
LDI r13, 221
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
