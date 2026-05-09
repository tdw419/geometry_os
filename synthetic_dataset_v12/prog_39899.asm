; DESCRIPTION: Composite: Draws a red circle centered at (415, 232) with radius 23 then Draws a orange line from (484, 59) to (451, 77) then Creates a cyan rectangular region at (205, 107) spanning 45 by 45 pixels.
; PLAN: r0=415(x), r1=232(y), r2=23(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=484(x1), r6=59(y1), r7=451(x2), r8=77(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=205(x), r11=107(y), r12=45(width), r13=45(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 415
LDI r1, 232
LDI r2, 23
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 484
LDI r6, 59
LDI r7, 451
LDI r8, 77
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 205
LDI r11, 107
LDI r12, 45
LDI r13, 45
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
