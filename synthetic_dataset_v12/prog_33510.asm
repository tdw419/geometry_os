; DESCRIPTION: Composite: Places a white line segment connecting (162, 176) to (489, 174) then Creates a green rectangular region at (298, 3) spanning 119 by 114 pixels.
; PLAN: r0=162(x1), r1=176(y1), r2=489(x2), r3=174(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=298(x), r6=3(y), r7=119(width), r8=114(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 162
LDI r1, 176
LDI r2, 489
LDI r3, 174
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 298
LDI r6, 3
LDI r7, 119
LDI r8, 114
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
