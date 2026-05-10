; DESCRIPTION: Composite: Draws a magenta line from (214, 202) to (505, 123) then Creates a orange rectangular region at (338, 197) spanning 97 by 20 pixels.
; PLAN: r0=214(x1), r1=202(y1), r2=505(x2), r3=123(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=338(x), r6=197(y), r7=97(width), r8=20(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 214
LDI r1, 202
LDI r2, 505
LDI r3, 123
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 338
LDI r6, 197
LDI r7, 97
LDI r8, 20
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
