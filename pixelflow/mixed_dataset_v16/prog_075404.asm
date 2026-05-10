; DESCRIPTION: Composite: Draws a white rectangle at (148, 119) with width 116 and height 13 then Draws a magenta line from (55, 87) to (355, 172).
; PLAN: r0=148(x), r1=119(y), r2=116(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=55(x1), r6=87(y1), r7=355(x2), r8=172(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 148
LDI r1, 119
LDI r2, 116
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 55
LDI r6, 87
LDI r7, 355
LDI r8, 172
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
