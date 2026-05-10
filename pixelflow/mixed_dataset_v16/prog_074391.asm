; DESCRIPTION: Composite: Draws a orange rectangle at (264, 124) with width 80 and height 81 then Places a red line segment connecting (309, 116) to (21, 212).
; PLAN: r0=264(x), r1=124(y), r2=80(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=309(x1), r6=116(y1), r7=21(x2), r8=212(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 264
LDI r1, 124
LDI r2, 80
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 309
LDI r6, 116
LDI r7, 21
LDI r8, 212
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
