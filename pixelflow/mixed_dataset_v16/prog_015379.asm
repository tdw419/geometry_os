; DESCRIPTION: Composite: Draws a white circle centered at (287, 80) with radius 69 then Draws a red line from (116, 4) to (450, 252).
; PLAN: r0=287(x), r1=80(y), r2=69(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=116(x1), r6=4(y1), r7=450(x2), r8=252(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 287
LDI r1, 80
LDI r2, 69
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 116
LDI r6, 4
LDI r7, 450
LDI r8, 252
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
