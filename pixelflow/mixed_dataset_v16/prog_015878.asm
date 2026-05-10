; DESCRIPTION: Composite: Sets a single cyan pixel at (424, 31) then Draws a blue line from (331, 163) to (319, 59) then Creates a blue rectangular region at (261, 117) spanning 77 by 85 pixels.
; PLAN: r0=424(x), r1=31(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=331(x1), r6=163(y1), r7=319(x2), r8=59(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=261(x), r11=117(y), r12=77(width), r13=85(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 424
LDI r1, 31
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 331
LDI r6, 163
LDI r7, 319
LDI r8, 59
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 261
LDI r11, 117
LDI r12, 77
LDI r13, 85
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
