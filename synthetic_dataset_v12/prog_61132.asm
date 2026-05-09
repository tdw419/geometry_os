; DESCRIPTION: Composite: Creates a yellow rectangular region at (14, 91) spanning 112 by 43 pixels then Sets a single magenta pixel at (89, 222) then Draws a white line from (486, 31) to (160, 135).
; PLAN: r0=14(x), r1=91(y), r2=112(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=89(x), r6=222(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=486(x1), r11=31(y1), r12=160(x2), r13=135(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 14
LDI r1, 91
LDI r2, 112
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 89
LDI r6, 222
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 486
LDI r11, 31
LDI r12, 160
LDI r13, 135
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
