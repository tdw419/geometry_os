; DESCRIPTION: Composite: Places a white line segment connecting (505, 0) to (85, 162) then Creates a blue rectangular region at (270, 144) spanning 104 by 68 pixels.
; PLAN: r0=505(x1), r1=0(y1), r2=85(x2), r3=162(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=270(x), r6=144(y), r7=104(width), r8=68(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 505
LDI r1, 0
LDI r2, 85
LDI r3, 162
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 270
LDI r6, 144
LDI r7, 104
LDI r8, 68
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
