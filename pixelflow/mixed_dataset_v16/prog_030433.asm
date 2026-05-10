; DESCRIPTION: Composite: Draws a white line from (125, 139) to (312, 232) then Creates a magenta rectangular region at (186, 85) spanning 118 by 16 pixels.
; PLAN: r0=125(x1), r1=139(y1), r2=312(x2), r3=232(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=186(x), r6=85(y), r7=118(width), r8=16(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 125
LDI r1, 139
LDI r2, 312
LDI r3, 232
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 186
LDI r6, 85
LDI r7, 118
LDI r8, 16
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
