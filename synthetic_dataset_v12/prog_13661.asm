; DESCRIPTION: Composite: Places a black 78x35 rectangle at position (70, 141) then Draws a green line from (261, 27) to (189, 61) then Creates a blue circular shape at (85, 51) with radius 31.
; PLAN: r0=70(x), r1=141(y), r2=78(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=261(x1), r6=27(y1), r7=189(x2), r8=61(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=85(x), r11=51(y), r12=31(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 70
LDI r1, 141
LDI r2, 78
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 261
LDI r6, 27
LDI r7, 189
LDI r8, 61
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 85
LDI r11, 51
LDI r12, 31
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
