; DESCRIPTION: Composite: Creates a white rectangular region at (363, 133) spanning 97 by 75 pixels then Places a white line segment connecting (89, 237) to (1, 64) then Draws a red circle centered at (218, 168) with radius 54.
; PLAN: r0=363(x), r1=133(y), r2=97(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=89(x1), r6=237(y1), r7=1(x2), r8=64(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=218(x), r11=168(y), r12=54(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 363
LDI r1, 133
LDI r2, 97
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 89
LDI r6, 237
LDI r7, 1
LDI r8, 64
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 218
LDI r11, 168
LDI r12, 54
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
