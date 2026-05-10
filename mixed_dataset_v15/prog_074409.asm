; DESCRIPTION: Composite: Places a orange 73x49 rectangle at position (84, 83) then Draws a red line from (147, 76) to (357, 37).
; PLAN: r0=84(x), r1=83(y), r2=73(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=147(x1), r6=76(y1), r7=357(x2), r8=37(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 84
LDI r1, 83
LDI r2, 73
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 147
LDI r6, 76
LDI r7, 357
LDI r8, 37
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
