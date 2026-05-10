; DESCRIPTION: Composite: Creates a magenta rectangular region at (309, 26) spanning 115 by 85 pixels then Draws a white line from (482, 192) to (83, 160).
; PLAN: r0=309(x), r1=26(y), r2=115(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=482(x1), r6=192(y1), r7=83(x2), r8=160(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 309
LDI r1, 26
LDI r2, 115
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 482
LDI r6, 192
LDI r7, 83
LDI r8, 160
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
