; DESCRIPTION: Composite: Draws a yellow rectangle at (386, 4) with width 79 and height 106 then Places a red line segment connecting (85, 126) to (78, 115).
; PLAN: r0=386(x), r1=4(y), r2=79(width), r3=106(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=85(x1), r6=126(y1), r7=78(x2), r8=115(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 386
LDI r1, 4
LDI r2, 79
LDI r3, 106
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 85
LDI r6, 126
LDI r7, 78
LDI r8, 115
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
