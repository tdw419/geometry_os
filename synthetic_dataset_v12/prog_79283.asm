; DESCRIPTION: Composite: Draws a yellow line from (45, 112) to (303, 16) then Creates a magenta rectangular region at (179, 89) spanning 105 by 60 pixels.
; PLAN: r0=45(x1), r1=112(y1), r2=303(x2), r3=16(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=179(x), r6=89(y), r7=105(width), r8=60(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 45
LDI r1, 112
LDI r2, 303
LDI r3, 16
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 179
LDI r6, 89
LDI r7, 105
LDI r8, 60
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
