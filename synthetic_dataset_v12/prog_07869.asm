; DESCRIPTION: Composite: Places a red line segment connecting (443, 137) to (402, 188) then Draws a red rectangle at (165, 40) with width 43 and height 36.
; PLAN: r0=443(x1), r1=137(y1), r2=402(x2), r3=188(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=165(x), r6=40(y), r7=43(width), r8=36(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 443
LDI r1, 137
LDI r2, 402
LDI r3, 188
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 165
LDI r6, 40
LDI r7, 43
LDI r8, 36
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
