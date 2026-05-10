; DESCRIPTION: Composite: Draws a orange line from (57, 15) to (200, 95) then Sets a single blue pixel at (115, 37) then Creates a yellow rectangular region at (255, 11) spanning 73 by 103 pixels.
; PLAN: r0=57(x1), r1=15(y1), r2=200(x2), r3=95(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=115(x), r6=37(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=255(x), r11=11(y), r12=73(width), r13=103(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 57
LDI r1, 15
LDI r2, 200
LDI r3, 95
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 115
LDI r6, 37
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 255
LDI r11, 11
LDI r12, 73
LDI r13, 103
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
