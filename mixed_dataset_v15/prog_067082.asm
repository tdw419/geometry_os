; DESCRIPTION: Composite: Creates a red rectangular region at (150, 139) spanning 104 by 60 pixels then Draws a blue line from (439, 13) to (319, 85) then Draws a red circle centered at (173, 147) with radius 57.
; PLAN: r0=150(x), r1=139(y), r2=104(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=439(x1), r6=13(y1), r7=319(x2), r8=85(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=173(x), r11=147(y), r12=57(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 150
LDI r1, 139
LDI r2, 104
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 439
LDI r6, 13
LDI r7, 319
LDI r8, 85
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 173
LDI r11, 147
LDI r12, 57
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
