; DESCRIPTION: Composite: Places a green 50x113 rectangle at position (147, 104) then Draws a orange line from (453, 105) to (186, 85).
; PLAN: r0=147(x), r1=104(y), r2=50(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=453(x1), r6=105(y1), r7=186(x2), r8=85(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 147
LDI r1, 104
LDI r2, 50
LDI r3, 113
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 453
LDI r6, 105
LDI r7, 186
LDI r8, 85
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
