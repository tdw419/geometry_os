; DESCRIPTION: Composite: Draws a blue line from (471, 193) to (35, 201) then Draws a orange rectangle at (404, 75) with width 85 and height 89.
; PLAN: r0=471(x1), r1=193(y1), r2=35(x2), r3=201(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=404(x), r6=75(y), r7=85(width), r8=89(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 471
LDI r1, 193
LDI r2, 35
LDI r3, 201
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 404
LDI r6, 75
LDI r7, 85
LDI r8, 89
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
