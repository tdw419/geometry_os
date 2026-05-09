; DESCRIPTION: Composite: Places a white circle of radius 14 at center (19, 155) then Creates a purple rectangular region at (392, 171) spanning 51 by 35 pixels then Places a orange line segment connecting (117, 175) to (120, 82).
; PLAN: r0=19(x), r1=155(y), r2=14(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=392(x), r6=171(y), r7=51(width), r8=35(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=117(x1), r11=175(y1), r12=120(x2), r13=82(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 19
LDI r1, 155
LDI r2, 14
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 392
LDI r6, 171
LDI r7, 51
LDI r8, 35
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 117
LDI r11, 175
LDI r12, 120
LDI r13, 82
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
