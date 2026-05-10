; DESCRIPTION: Composite: Creates a blue rectangular region at (444, 66) spanning 49 by 98 pixels then Draws a orange line from (508, 207) to (275, 71).
; PLAN: r0=444(x), r1=66(y), r2=49(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=508(x1), r6=207(y1), r7=275(x2), r8=71(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 444
LDI r1, 66
LDI r2, 49
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 508
LDI r6, 207
LDI r7, 275
LDI r8, 71
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
