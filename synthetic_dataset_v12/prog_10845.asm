; DESCRIPTION: Composite: Creates a white rectangular region at (450, 35) spanning 53 by 84 pixels then Draws a yellow circle centered at (401, 138) with radius 54 then Draws a red line from (334, 132) to (467, 141).
; PLAN: r0=450(x), r1=35(y), r2=53(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=401(x), r6=138(y), r7=54(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=334(x1), r11=132(y1), r12=467(x2), r13=141(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 450
LDI r1, 35
LDI r2, 53
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 401
LDI r6, 138
LDI r7, 54
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 334
LDI r11, 132
LDI r12, 467
LDI r13, 141
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
