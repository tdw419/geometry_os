; DESCRIPTION: Composite: Sets a single yellow pixel at (63, 62) then Creates a purple rectangular region at (418, 171) spanning 59 by 63 pixels then Draws a white line from (359, 84) to (40, 7).
; PLAN: r0=63(x), r1=62(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=418(x), r6=171(y), r7=59(width), r8=63(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=359(x1), r11=84(y1), r12=40(x2), r13=7(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 63
LDI r1, 62
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 418
LDI r6, 171
LDI r7, 59
LDI r8, 63
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 359
LDI r11, 84
LDI r12, 40
LDI r13, 7
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
