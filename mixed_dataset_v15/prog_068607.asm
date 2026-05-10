; DESCRIPTION: Composite: Draws a red rectangle at (223, 116) with width 117 and height 110 then Places a yellow line segment connecting (9, 229) to (319, 148).
; PLAN: r0=223(x), r1=116(y), r2=117(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=9(x1), r6=229(y1), r7=319(x2), r8=148(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 223
LDI r1, 116
LDI r2, 117
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 9
LDI r6, 229
LDI r7, 319
LDI r8, 148
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
