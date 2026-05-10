; DESCRIPTION: Composite: Creates a green rectangular region at (47, 14) spanning 112 by 43 pixels then Places a orange line segment connecting (479, 91) to (58, 147).
; PLAN: r0=47(x), r1=14(y), r2=112(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=479(x1), r6=91(y1), r7=58(x2), r8=147(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 47
LDI r1, 14
LDI r2, 112
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 479
LDI r6, 91
LDI r7, 58
LDI r8, 147
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
