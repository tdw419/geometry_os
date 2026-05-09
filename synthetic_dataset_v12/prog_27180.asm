; DESCRIPTION: Composite: Places a blue line segment connecting (105, 158) to (79, 136) then Creates a orange rectangular region at (6, 90) spanning 86 by 57 pixels.
; PLAN: r0=105(x1), r1=158(y1), r2=79(x2), r3=136(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=6(x), r6=90(y), r7=86(width), r8=57(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 105
LDI r1, 158
LDI r2, 79
LDI r3, 136
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 6
LDI r6, 90
LDI r7, 86
LDI r8, 57
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
