; DESCRIPTION: Composite: Draws a orange rectangle at (404, 195) with width 15 and height 26 then Places a white line segment connecting (80, 28) to (98, 147).
; PLAN: r0=404(x), r1=195(y), r2=15(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=80(x1), r6=28(y1), r7=98(x2), r8=147(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 404
LDI r1, 195
LDI r2, 15
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 80
LDI r6, 28
LDI r7, 98
LDI r8, 147
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
