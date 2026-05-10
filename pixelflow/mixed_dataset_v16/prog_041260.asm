; DESCRIPTION: Composite: Places a red line segment connecting (232, 150) to (172, 133) then Draws a red circle centered at (121, 167) with radius 42.
; PLAN: r0=232(x1), r1=150(y1), r2=172(x2), r3=133(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=121(x), r6=167(y), r7=42(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 232
LDI r1, 150
LDI r2, 172
LDI r3, 133
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 121
LDI r6, 167
LDI r7, 42
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
