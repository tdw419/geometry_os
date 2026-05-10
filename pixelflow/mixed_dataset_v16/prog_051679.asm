; DESCRIPTION: Composite: Draws a magenta line from (251, 142) to (359, 176) then Creates a white rectangular region at (185, 207) spanning 14 by 22 pixels.
; PLAN: r0=251(x1), r1=142(y1), r2=359(x2), r3=176(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=185(x), r6=207(y), r7=14(width), r8=22(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 251
LDI r1, 142
LDI r2, 359
LDI r3, 176
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 185
LDI r6, 207
LDI r7, 14
LDI r8, 22
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
