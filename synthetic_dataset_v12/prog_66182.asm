; DESCRIPTION: Composite: Draws a green line from (413, 105) to (230, 94) then Sets a single red pixel at (115, 162) then Creates a green rectangular region at (299, 11) spanning 61 by 100 pixels.
; PLAN: r0=413(x1), r1=105(y1), r2=230(x2), r3=94(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=115(x), r6=162(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=299(x), r11=11(y), r12=61(width), r13=100(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 413
LDI r1, 105
LDI r2, 230
LDI r3, 94
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 115
LDI r6, 162
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 299
LDI r11, 11
LDI r12, 61
LDI r13, 100
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
