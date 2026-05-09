; DESCRIPTION: Composite: Draws a red circle centered at (305, 106) with radius 75 then Creates a yellow rectangular region at (296, 103) spanning 47 by 100 pixels then Draws a white line from (199, 120) to (89, 57).
; PLAN: r0=305(x), r1=106(y), r2=75(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=296(x), r6=103(y), r7=47(width), r8=100(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=199(x1), r11=120(y1), r12=89(x2), r13=57(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 305
LDI r1, 106
LDI r2, 75
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 296
LDI r6, 103
LDI r7, 47
LDI r8, 100
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 199
LDI r11, 120
LDI r12, 89
LDI r13, 57
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
