; DESCRIPTION: Composite: Draws a magenta rectangle at (212, 82) with width 102 and height 104 then Draws a orange line from (98, 168) to (218, 202).
; PLAN: r0=212(x), r1=82(y), r2=102(width), r3=104(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=98(x1), r6=168(y1), r7=218(x2), r8=202(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 212
LDI r1, 82
LDI r2, 102
LDI r3, 104
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 98
LDI r6, 168
LDI r7, 218
LDI r8, 202
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
