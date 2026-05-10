; DESCRIPTION: Composite: Places a blue line segment connecting (332, 90) to (235, 204) then Draws a orange rectangle at (139, 174) with width 30 and height 75.
; PLAN: r0=332(x1), r1=90(y1), r2=235(x2), r3=204(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=139(x), r6=174(y), r7=30(width), r8=75(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 332
LDI r1, 90
LDI r2, 235
LDI r3, 204
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 139
LDI r6, 174
LDI r7, 30
LDI r8, 75
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
