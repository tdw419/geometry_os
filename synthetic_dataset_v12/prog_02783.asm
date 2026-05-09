; DESCRIPTION: Composite: Creates a orange rectangular region at (171, 9) spanning 73 by 47 pixels then Sets a single yellow pixel at (59, 227) then Places a blue line segment connecting (256, 176) to (428, 205).
; PLAN: r0=171(x), r1=9(y), r2=73(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=59(x), r6=227(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=256(x1), r11=176(y1), r12=428(x2), r13=205(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 171
LDI r1, 9
LDI r2, 73
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 59
LDI r6, 227
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 256
LDI r11, 176
LDI r12, 428
LDI r13, 205
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
