; DESCRIPTION: Composite: Places a yellow dot at position (9, 246) then Places a red line segment connecting (262, 84) to (358, 80) then Draws a red circle centered at (410, 85) with radius 70.
; PLAN: r0=9(x), r1=246(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=262(x1), r6=84(y1), r7=358(x2), r8=80(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=410(x), r11=85(y), r12=70(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 9
LDI r1, 246
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 262
LDI r6, 84
LDI r7, 358
LDI r8, 80
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 410
LDI r11, 85
LDI r12, 70
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
