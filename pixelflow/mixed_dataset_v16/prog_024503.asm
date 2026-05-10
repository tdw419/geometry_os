; DESCRIPTION: Composite: Creates a purple rectangular region at (427, 77) spanning 23 by 56 pixels then Draws a magenta line from (328, 163) to (159, 234).
; PLAN: r0=427(x), r1=77(y), r2=23(width), r3=56(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=328(x1), r6=163(y1), r7=159(x2), r8=234(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 427
LDI r1, 77
LDI r2, 23
LDI r3, 56
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 328
LDI r6, 163
LDI r7, 159
LDI r8, 234
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
