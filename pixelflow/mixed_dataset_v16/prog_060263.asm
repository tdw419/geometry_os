; DESCRIPTION: Composite: Draws a white line from (304, 203) to (417, 234) then Creates a white rectangular region at (307, 72) spanning 31 by 92 pixels.
; PLAN: r0=304(x1), r1=203(y1), r2=417(x2), r3=234(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=307(x), r6=72(y), r7=31(width), r8=92(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 304
LDI r1, 203
LDI r2, 417
LDI r3, 234
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 307
LDI r6, 72
LDI r7, 31
LDI r8, 92
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
