; DESCRIPTION: Composite: Creates a cyan rectangular region at (394, 58) spanning 55 by 114 pixels then Draws a orange line from (312, 178) to (276, 164).
; PLAN: r0=394(x), r1=58(y), r2=55(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=312(x1), r6=178(y1), r7=276(x2), r8=164(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 394
LDI r1, 58
LDI r2, 55
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 312
LDI r6, 178
LDI r7, 276
LDI r8, 164
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
