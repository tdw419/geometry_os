; DESCRIPTION: Composite: Draws a magenta line from (306, 246) to (237, 232) then Creates a orange rectangular region at (370, 145) spanning 14 by 28 pixels.
; PLAN: r0=306(x1), r1=246(y1), r2=237(x2), r3=232(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=370(x), r6=145(y), r7=14(width), r8=28(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 306
LDI r1, 246
LDI r2, 237
LDI r3, 232
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 370
LDI r6, 145
LDI r7, 14
LDI r8, 28
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
