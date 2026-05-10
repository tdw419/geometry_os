; DESCRIPTION: Composite: Creates a blue rectangular region at (390, 89) spanning 59 by 38 pixels then Draws a blue line from (239, 79) to (451, 45).
; PLAN: r0=390(x), r1=89(y), r2=59(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=239(x1), r6=79(y1), r7=451(x2), r8=45(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 390
LDI r1, 89
LDI r2, 59
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 239
LDI r6, 79
LDI r7, 451
LDI r8, 45
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
