; DESCRIPTION: Composite: Creates a orange rectangular region at (312, 116) spanning 68 by 47 pixels then Draws a magenta line from (475, 41) to (322, 236).
; PLAN: r0=312(x), r1=116(y), r2=68(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=475(x1), r6=41(y1), r7=322(x2), r8=236(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 312
LDI r1, 116
LDI r2, 68
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 475
LDI r6, 41
LDI r7, 322
LDI r8, 236
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
