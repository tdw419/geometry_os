; DESCRIPTION: Composite: Places a red line segment connecting (255, 156) to (242, 89) then Draws a white rectangle at (311, 162) with width 104 and height 78.
; PLAN: r0=255(x1), r1=156(y1), r2=242(x2), r3=89(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=311(x), r6=162(y), r7=104(width), r8=78(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 255
LDI r1, 156
LDI r2, 242
LDI r3, 89
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 311
LDI r6, 162
LDI r7, 104
LDI r8, 78
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
