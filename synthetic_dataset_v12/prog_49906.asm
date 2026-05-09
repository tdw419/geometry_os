; DESCRIPTION: Composite: Draws a green line from (199, 3) to (309, 139) then Draws a blue rectangle at (432, 36) with width 79 and height 104.
; PLAN: r0=199(x1), r1=3(y1), r2=309(x2), r3=139(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=432(x), r6=36(y), r7=79(width), r8=104(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 199
LDI r1, 3
LDI r2, 309
LDI r3, 139
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 432
LDI r6, 36
LDI r7, 79
LDI r8, 104
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
